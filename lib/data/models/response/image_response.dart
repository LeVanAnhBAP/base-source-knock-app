

import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_response.freezed.dart';
part 'image_response.g.dart';
@freezed
class ImageResponse with _$ImageResponse{
  const factory ImageResponse({
    @JsonKey(name: 'url')  String? url,
    @JsonKey(name: 'path')  String? path,
  }) = _ImageResponse;
     factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}