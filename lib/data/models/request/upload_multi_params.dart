

import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_multi_params.freezed.dart';
part 'upload_multi_params.g.dart';
@freezed
class UploadMultiParams with _$UploadMultiParams{
  const factory UploadMultiParams({
    @JsonKey(name: 'file_paths') 
    @Default([])
    List<String> filePaths,
}) = _UploadMultiParams;
  factory UploadMultiParams.fromJson(Map<String, Object?> json) =>
      _$UploadMultiParamsFromJson(json);
}