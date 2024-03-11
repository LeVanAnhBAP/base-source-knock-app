
import 'package:freezed_annotation/freezed_annotation.dart';
part 'static_data_params.freezed.dart';
part 'static_data_params.g.dart';
@freezed
class StaticDataParams with _$StaticDataParams{
  const factory StaticDataParams({
    @JsonKey(name: 'sources') required List<String> sources
}) = _StaticDataParams;
  factory StaticDataParams.fromJson(Map<String, Object?> json) =>
      _$StaticDataParamsFromJson(json);
}