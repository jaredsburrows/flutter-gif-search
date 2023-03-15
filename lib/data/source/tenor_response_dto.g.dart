// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorResponseDto _$TenorResponseDtoFromJson(Map<String, dynamic> json) =>
    TenorResponseDto(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ResultDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      next: json['next'] as String? ?? '0.0',
    );

Map<String, dynamic> _$TenorResponseDtoToJson(TenorResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'next': instance.next,
    };
