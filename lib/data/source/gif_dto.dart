import 'package:json_annotation/json_annotation.dart';

part 'gif_dto.g.dart';

@JsonSerializable()
class GifDto {
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'preview')
  final String preview;

  const GifDto({this.url = '', this.preview = ''});

  factory GifDto.fromJson(Map<String, dynamic> json) => _$GifDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GifDtoToJson(this);
}
