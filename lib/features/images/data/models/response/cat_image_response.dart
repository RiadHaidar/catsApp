import 'package:json_annotation/json_annotation.dart';
import '../../../../breed/data/models/response/breed_response.dart';

part 'cat_image_response.g.dart';

@JsonSerializable()
class CatImageResponse {
  final String id;
  final String url;
  final int width;
  final int height;

  @JsonKey(name: 'breeds')
  final List<BreedResponse>? breeds;

  CatImageResponse({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    this.breeds,
  });

  factory CatImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CatImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatImageResponseToJson(this);
}
