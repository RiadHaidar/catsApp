import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_app/features/breed/presentation/screens/breed_screen.dart';
import 'package:cat_app/features/breed/presentation/logic/breed_cubit.dart';
import 'package:cat_app/features/breed/presentation/logic/breed_states.dart';
import 'package:cat_app/features/breed/data/models/response/breed_response.dart';

import 'breed_screen_test.mocks.dart';

@GenerateMocks([BreedCubit])
void main() {
  late MockBreedCubit mockBreedCubit;

  setUpAll(() {
    provideDummy<BreedStates>(BreedInitial());
  });

  setUp(() {
    mockBreedCubit = MockBreedCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<BreedCubit>.value(
        value: mockBreedCubit,
        child: const BreedScreen(),
      ),
    );
  }

  group('BreedScreen Widget Tests', () {
    testWidgets('shows loading indicator when state is BreedsLoading',
        (WidgetTester tester) async {
      // Arrange
      when(mockBreedCubit.state).thenReturn(BreedsLoading());
      when(mockBreedCubit.stream).thenAnswer((_) => Stream.value(BreedsLoading()));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows breed list when state is BreedsSuccess',
        (WidgetTester tester) async {
      // Arrange
      final mockBreeds = [
        BreedResponse(
          weight: BreedWeight(imperial: '7-10', metric: '3-5'),
          id: 'abys',
          name: 'Abyssinian',
          temperament: 'Active, Energetic',
          origin: 'Egypt',
          description: 'The Abyssinian is easy to care for.',
          lifeSpan: '14-15',
          indoor: 0,
          lap: 1,
          altNames: '',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 3,
          dogFriendly: 4,
          energyLevel: 5,
          grooming: 1,
          healthIssues: 2,
          intelligence: 5,
          sheddingLevel: 2,
          socialNeeds: 5,
          strangerFriendly: 5,
          vocalisation: 1,
          experimental: 0,
          hairless: 0,
          natural: 1,
          rare: 0,
          rex: 0,
          suppressedTail: 0,
          shortLegs: 0,
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
          hypoallergenic: 0,
          referenceImageId: '0XYvRd7oD',
        ),
      ];

      when(mockBreedCubit.state).thenReturn(BreedsSuccess(mockBreeds));
      when(mockBreedCubit.stream)
          .thenAnswer((_) => Stream.value(BreedsSuccess(mockBreeds)));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.text('Find Your Forever Pet'), findsOneWidget);
      expect(find.text('Abyssinian'), findsOneWidget);
      expect(find.text('Egypt'), findsOneWidget);
    });
  });
}
