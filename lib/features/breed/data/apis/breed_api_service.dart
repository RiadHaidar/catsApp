import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/response/breed_response.dart';
import 'breed_api_constants.dart';

part 'breed_api_service.g.dart';

@RestApi()
abstract class BreedApiService {
  factory BreedApiService(Dio dio, {String baseUrl}) = _BreedApiService;

  @GET(BreedApiConstants.getBreeds)
  Future<List<BreedResponse>> getBreeds({
    @Query('limit') int? limit,
    @Query('page') int? page,
  });

  @GET(BreedApiConstants.getBreedById)
  Future<BreedResponse> getBreedById(
    @Path('breed_id') String breedId,
  );

  @GET(BreedApiConstants.searchBreeds)
  Future<List<BreedResponse>> searchBreeds({
    @Query('q') required String query,
    @Query('attach_image') int? attachImage,
  });
}
