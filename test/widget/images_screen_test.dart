import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_app/features/images/presentation/screens/images_screen.dart';
import 'package:cat_app/features/images/presentation/logic/images_cubit.dart';
import 'package:cat_app/features/images/presentation/logic/images_states.dart';
import 'package:cat_app/features/images/data/models/response/cat_image_response.dart';

import 'images_screen_test.mocks.dart';

@GenerateMocks([ImagesCubit])
void main() {
  late MockImagesCubit mockImagesCubit;

  setUpAll(() {
    provideDummy<ImagesStates>(ImagesInitial());
  });

  setUp(() {
    mockImagesCubit = MockImagesCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ImagesCubit>.value(
        value: mockImagesCubit,
        child: const ImagesScreen(),
      ),
    );
  }

  group('ImagesScreen Widget Tests', () {
    testWidgets('shows loading indicator when state is ImagesLoading',
        (WidgetTester tester) async {
      // Arrange
      when(mockImagesCubit.state).thenReturn(ImagesLoading());
      when(mockImagesCubit.stream)
          .thenAnswer((_) => Stream.value(ImagesLoading()));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows images grid when state is ImagesSuccess',
        (WidgetTester tester) async {
      // Arrange
      final mockImages = [
        CatImageResponse(
          id: 'img1',
          url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
          width: 500,
          height: 500,
        ),
        CatImageResponse(
          id: 'img2',
          url: 'https://cdn2.thecatapi.com/images/1234abcd.jpg',
          width: 600,
          height: 600,
        ),
      ];

      when(mockImagesCubit.state).thenReturn(ImagesSuccess(mockImages));
      when(mockImagesCubit.stream)
          .thenAnswer((_) => Stream.value(ImagesSuccess(mockImages)));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Assert
      expect(find.text('Discover Cat Images'), findsOneWidget);
      expect(
          find.text('Beautiful cat photos from around the world'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
