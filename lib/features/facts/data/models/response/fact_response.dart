import 'package:json_annotation/json_annotation.dart';

part 'fact_response.g.dart';

@JsonSerializable()
class FactResponse {
  final String id;
  final String fact;

  @JsonKey(name: 'breed_id')
  final String? breedId;

  final String? title;

  FactResponse({
    required this.id,
    required this.fact,
    this.breedId,
    this.title,
  });

  factory FactResponse.fromJson(Map<String, dynamic> json) =>
      _$FactResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FactResponseToJson(this);
}
