// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifDto _$GifDtoFromJson(Map<String, dynamic> json) => GifDto(
      url: json['url'] as String? ?? '',
      preview: json['preview'] as String? ?? '',
    );

Map<String, dynamic> _$GifDtoToJson(GifDto instance) => <String, dynamic>{
      'url': instance.url,
      'preview': instance.preview,
    };
