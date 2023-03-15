// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) => MediaDto(
      gif: json['gif'] == null
          ? const GifDto()
          : GifDto.fromJson(json['gif'] as Map<String, dynamic>),
      tinyGif: json['tinygif'] == null
          ? const GifDto()
          : GifDto.fromJson(json['tinygif'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaDtoToJson(MediaDto instance) => <String, dynamic>{
      'gif': instance.gif,
      'tinygif': instance.tinyGif,
    };
