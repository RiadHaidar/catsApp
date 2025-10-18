import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/facts_api_service.dart';
import '../models/response/fact_response.dart';

class FactsRepo {
  final FactsApiService _apiService;

  FactsRepo(this._apiService);

  Future<ApiResult<List<FactResponse>>> getFacts({
    int? limit,
    int? page,
    String? order,
  }) async {
    try {
      final result = await _apiService.getFacts(
        limit: limit ?? 10,
        page: page ?? 0,
        order: order ?? 'RAND',
      );
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }

  Future<ApiResult<List<FactResponse>>> getBreedFacts({
    required String breedId,
    int? limit,
    int? page,
    String? order,
  }) async {
    try {
      final result = await _apiService.getBreedFacts(
        breedId,
        limit: limit ?? 10,
        page: page ?? 0,
        order: order ?? 'RAND',
      );
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }
}
