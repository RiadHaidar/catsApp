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

  group('Images Flow Integration Test', () {
    testWidgets('should display images grid and allow refresh',
        (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(const CatApp());
      await tester.pumpAndSettle();

      // Navigate to Images tab
      await tester.tap(find.text('Images'));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify we're on images screen
      expect(find.text('Discover Cat Images'), findsOneWidget);
      expect(
          find.text('Beautiful cat photos from around the world'), findsOneWidget);

      // Verify grid is displayed
      expect(find.byType(GridView), findsOneWidget);

      // Try pull-to-refresh
      await tester.drag(
        find.byType(GridView),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify grid is still displayed after refresh
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
