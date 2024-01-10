

import 'package:freezed_annotation/freezed_annotation.dart';
part 'work_area_reponse.freezed.dart';
part 'work_area_reponse.g.dart';
@freezed
class WorkAreaResponse with _$WorkAreaResponse{
  const factory WorkAreaResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'serial_number') required int seriaNumber,
    @JsonKey(name: 'name') required String name,
  }) = _WorkAreaResponse;
    factory WorkAreaResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkAreaResponseFromJson(json);
}