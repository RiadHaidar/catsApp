import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/response/fact_response.dart';
import 'facts_api_constants.dart';

part 'facts_api_service.g.dart';

@RestApi()
abstract class FactsApiService {
  factory FactsApiService(Dio dio, {String baseUrl}) = _FactsApiService;

  @GET(FactsApiConstants.getFacts)
  Future<List<FactResponse>> getFacts({
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('order') String? order,
  });

  @GET(FactsApiConstants.getBreedFacts)
  Future<List<FactResponse>> getBreedFacts(
    @Path('breed_id') String breedId, {
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('order') String? order,
  });
}
