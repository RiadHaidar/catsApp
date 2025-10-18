import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_app/features/breed/data/repos/breed_repo.dart';
import 'package:cat_app/features/breed/data/apis/breed_api_service.dart';
import 'package:cat_app/features/breed/data/models/response/breed_response.dart';

import 'breed_repo_test.mocks.dart';

@GenerateMocks([BreedApiService])
void main() {
  late BreedRepo breedRepo;
  late MockBreedApiService mockApiService;

  setUp(() {
    mockApiService = MockBreedApiService();
    breedRepo = BreedRepo(mockApiService);
  });

  group('BreedRepo Tests', () {
    test('getBreeds should return success with list of breeds', () async {
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

      when(mockApiService.getBreeds(limit: 10, page: 0))
          .thenAnswer((_) async => mockBreeds);

      // Act
      final result = await breedRepo.getBreeds(limit: 10, page: 0);

      // Assert
      result.when(
        success: (breeds) {
          expect(breeds, equals(mockBreeds));
          expect(breeds.length, 1);
          expect(breeds.first.name, 'Abyssinian');
        },
        failure: (_) => fail('Should return success'),
      );

      verify(mockApiService.getBreeds(limit: 10, page: 0)).called(1);
    });

    test('getBreeds should return failure when API throws exception', () async {
      // Arrange
      when(mockApiService.getBreeds(limit: 10, page: 0))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await breedRepo.getBreeds(limit: 10, page: 0);

      // Assert
      result.when(
        success: (_) => fail('Should return failure'),
        failure: (error) {
          expect(error, contains('Exception'));
        },
      );
    });
  });
}
