import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/response/cat_image_response.dart';
import 'images_api_constants.dart';

part 'images_api_service.g.dart';

@RestApi()
abstract class ImagesApiService {
  factory ImagesApiService(Dio dio, {String baseUrl}) = _ImagesApiService;

  @GET(ImagesApiConstants.searchImages)
  Future<List<CatImageResponse>> searchImages({
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('order') String? order,
    @Query('size') String? size,
    @Query('mime_types') String? mimeTypes,
    @Query('has_breeds') int? hasBreeds,
  });
}
