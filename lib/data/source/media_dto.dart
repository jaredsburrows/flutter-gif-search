import 'package:flutter_gif_search/data/source/gif_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_dto.g.dart';

@JsonSerializable()
class MediaDto {
  @JsonKey(name: 'gif')
  final GifDto gif;
  @JsonKey(name: 'tinygif')
  final GifDto tinyGif;

  const MediaDto({this.gif = const GifDto(), this.tinyGif = const GifDto()});

  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);
}
