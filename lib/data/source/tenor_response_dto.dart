import 'package:flutter_gif_search/data/source/result_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tenor_response_dto.g.dart';

/// Tenor API Response.
///
/// Example: https://g.tenor.com/v1/search?key=LIVDSRZULELA&tag=goodluck&limit=10
@JsonSerializable()
class TenorResponseDto {
  @JsonKey(name: 'results')
  final List<ResultDto> results;
  @JsonKey(name: 'next')
  final String next;

  const TenorResponseDto({this.results = const [], this.next = '0.0'});

  factory TenorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TenorResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TenorResponseDtoToJson(this);
}
