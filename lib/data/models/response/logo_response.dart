

import 'package:freezed_annotation/freezed_annotation.dart';
part 'logo_response.freezed.dart';
part 'logo_response.g.dart';
@freezed
class LogoResponse with _$LogoResponse{
  const factory LogoResponse({
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'path') required String path,
  }) = _LogoResponse;
     factory LogoResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoResponseFromJson(json);
}