import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:cat_app/cat_app.dart';
import 'package:cat_app/core/di/dependency_injection.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupDependencies();
  });

  group('Breed Flow Integration Test', () {
    testWidgets('should display breeds and navigate between tabs',
        (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const CatApp());
      await tester.pumpAndSettle();

      // Wait for breeds to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify we're on the home screen with breeds tab
      expect(find.text('Find Your Forever Pet'), findsOneWidget);

      // Verify we have some breed cards displayed
      expect(find.byType(ListView), findsWidgets);

      // Tap on Images tab in bottom navigation
      await tester.tap(find.text('Images'));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify we're on images screen
      expect(find.text('Discover Cat Images'), findsOneWidget);

      // Tap back to Breeds tab
      await tester.tap(find.text('Breeds'));
      await tester.pumpAndSettle();

      // Verify we're back on breeds screen
      expect(find.text('Find Your Forever Pet'), findsOneWidget);
    });
  });
}
