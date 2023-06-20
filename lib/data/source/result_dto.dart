import 'package:flutter_gif_search/data/source/media_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class ResultDto {
  @JsonKey(name: 'media')
  final List<MediaDto> media;

  const ResultDto({this.media = const []});

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDtoToJson(this);
}
