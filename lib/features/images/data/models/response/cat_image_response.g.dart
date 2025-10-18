// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatImageResponse _$CatImageResponseFromJson(Map<String, dynamic> json) =>
    CatImageResponse(
      id: json['id'] as String,
      url: json['url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      breeds: (json['breeds'] as List<dynamic>?)
          ?.map((e) => BreedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatImageResponseToJson(CatImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'breeds': instance.breeds,
    };
