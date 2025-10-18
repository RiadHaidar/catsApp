// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactResponse _$FactResponseFromJson(Map<String, dynamic> json) => FactResponse(
      id: json['id'] as String,
      fact: json['fact'] as String,
      breedId: json['breed_id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$FactResponseToJson(FactResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fact': instance.fact,
      'breed_id': instance.breedId,
      'title': instance.title,
    };
