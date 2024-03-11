
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
part 'occupation_major_response.freezed.dart';
part 'occupation_major_response.g.dart';
@freezed
class OccupationMajorResponse with _$OccupationMajorResponse{
  const factory OccupationMajorResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'sub_items')  List<OccupationResponse>? subItems,
}) = _OccupationMajorResponse;
  factory OccupationMajorResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupationMajorResponseFromJson(json);
}