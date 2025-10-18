import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/breed_api_service.dart';
import '../models/response/breed_response.dart';

class BreedRepo {
  final BreedApiService _apiService;

  BreedRepo(this._apiService);

  Future<ApiResult<List<BreedResponse>>> getBreeds({
    int? limit,
    int? page,
  }) async {
    try {
      final result = await _apiService.getBreeds(
        limit: limit ?? 10,
        page: page ?? 0,
      );
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }

  Future<ApiResult<BreedResponse>> getBreedById(String breedId) async {
    try {
      final result = await _apiService.getBreedById(breedId);
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }

  Future<ApiResult<List<BreedResponse>>> searchBreeds({
    required String query,
    bool attachImage = true,
  }) async {
    try {
      final result = await _apiService.searchBreeds(
        query: query,
        attachImage: attachImage ? 1 : 0,
      );
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }
}
