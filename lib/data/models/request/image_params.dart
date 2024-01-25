

import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_params.freezed.dart';
part 'image_params.g.dart';
@freezed
class ImageParams with _$ImageParams{
  const factory ImageParams({
    @JsonKey(name: 'url') required String url
}) = _ImageParams;
  factory ImageParams.fromJson(Map<String, Object?> json) =>
      _$ImageParamsFromJson(json);
}