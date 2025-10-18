import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/images_api_service.dart';
import '../models/response/cat_image_response.dart';

class ImagesRepo {
  final ImagesApiService _apiService;

  ImagesRepo(this._apiService);

  Future<ApiResult<List<CatImageResponse>>> searchImages({
    int? limit,
    int? page,
    String? order,
    String? size,
    bool hasBreeds = true,
  }) async {
    try {
      final result = await _apiService.searchImages(
        limit: limit ?? 20,
        page: page ?? 0,
        order: order ?? 'RANDOM',
        size: size ?? 'med',
        mimeTypes: 'jpg,png',
        hasBreeds: hasBreeds ? 1 : 0,
      );
      return ApiResult.success(result);
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      return ApiResult.failure(error.message);
    }
  }
}
