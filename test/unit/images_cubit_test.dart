import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_app/features/images/presentation/logic/images_cubit.dart';
import 'package:cat_app/features/images/presentation/logic/images_states.dart';
import 'package:cat_app/features/images/data/repos/images_repo.dart';
import 'package:cat_app/features/images/data/models/response/cat_image_response.dart';
import 'package:cat_app/core/networking/api_result.dart';

import 'images_cubit_test.mocks.dart';

@GenerateMocks([ImagesRepo])
void main() {
  late MockImagesRepo mockImagesRepo;

  setUpAll(() {
    // Provide dummy value for ApiResult
    provideDummy<ApiResult<List<CatImageResponse>>>(
      ApiResult.success([]),
    );
  });

  setUp(() {
    mockImagesRepo = MockImagesRepo();
  });

  group('ImagesCubit Tests', () {
    blocTest<ImagesCubit, ImagesStates>(
      'emits ImagesSuccess when loadImages is successful (auto-loads on init)',
      setUp: () {
        final mockImages = [
          CatImageResponse(
            id: 'img1',
            url: 'https://example.com/cat1.jpg',
            width: 500,
            height: 500,
          ),
          CatImageResponse(
            id: 'img2',
            url: 'https://example.com/cat2.jpg',
            width: 600,
            height: 600,
          ),
        ];

        when(mockImagesRepo.searchImages(
          limit: anyNamed('limit'),
          page: anyNamed('page'),
          order: anyNamed('order'),
          size: anyNamed('size'),
          hasBreeds: anyNamed('hasBreeds'),
        )).thenAnswer((_) async => ApiResult.success(mockImages));
      },
      build: () => ImagesCubit(mockImagesRepo),
      wait: const Duration(milliseconds: 300),
      verify: (cubit) {
        expect(cubit.state, isA<ImagesSuccess>());
        final state = cubit.state as ImagesSuccess;
        expect(state.images.length, 2);
        expect(state.images.first.id, 'img1');
      },
    );

    blocTest<ImagesCubit, ImagesStates>(
      'emits ImagesFailure when loadImages fails (auto-loads on init)',
      setUp: () {
        when(mockImagesRepo.searchImages(
          limit: anyNamed('limit'),
          page: anyNamed('page'),
          order: anyNamed('order'),
          size: anyNamed('size'),
          hasBreeds: anyNamed('hasBreeds'),
        )).thenAnswer((_) async => ApiResult.failure('Network error'));
      },
      build: () => ImagesCubit(mockImagesRepo),
      wait: const Duration(milliseconds: 300),
      verify: (cubit) {
        expect(cubit.state, isA<ImagesFailure>());
        final state = cubit.state as ImagesFailure;
        expect(state.message, 'Network error');
      },
    );
  });
}
