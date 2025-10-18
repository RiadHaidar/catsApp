import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';

@JsonSerializable()
class BreedWeight {
  final String imperial;
  final String metric;

  BreedWeight({
    required this.imperial,
    required this.metric,
  });

  factory BreedWeight.fromJson(Map<String, dynamic> json) =>
      _$BreedWeightFromJson(json);
  Map<String, dynamic> toJson() => _$BreedWeightToJson(this);
}

@JsonSerializable()
class BreedImage {
  final String id;
  final int width;
  final int height;
  final String url;

  BreedImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);
  Map<String, dynamic> toJson() => _$BreedImageToJson(this);
}

@JsonSerializable()
class BreedResponse {
  final BreedWeight weight;
  final String id;
  final String name;

  @JsonKey(name: 'cfa_url')
  final String? cfaUrl;

  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;

  @JsonKey(name: 'vcahospitals_url')
  final String? vcahospitalsUrl;

  final String? temperament;
  final String? origin;

  @JsonKey(name: 'country_codes')
  final String? countryCodes;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  final String description;

  @JsonKey(name: 'life_span')
  final String lifeSpan;

  final int? indoor;
  final int? lap;

  @JsonKey(name: 'alt_names')
  final String? altNames;

  final int? adaptability;

  @JsonKey(name: 'affection_level')
  final int? affectionLevel;

  @JsonKey(name: 'child_friendly')
  final int? childFriendly;

  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;

  @JsonKey(name: 'energy_level')
  final int? energyLevel;

  final int? grooming;

  @JsonKey(name: 'health_issues')
  final int? healthIssues;

  final int? intelligence;

  @JsonKey(name: 'shedding_level')
  final int? sheddingLevel;

  @JsonKey(name: 'social_needs')
  final int? socialNeeds;

  @JsonKey(name: 'stranger_friendly')
  final int? strangerFriendly;

  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;

  @JsonKey(name: 'suppressed_tail')
  final int? suppressedTail;

  @JsonKey(name: 'short_legs')
  final int? shortLegs;

  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  final int? hypoallergenic;

  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  final BreedImage? image;

  BreedResponse({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    required this.description,
    required this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.image,
  });

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BreedResponseToJson(this);
}
