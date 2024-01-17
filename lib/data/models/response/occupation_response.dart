
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/occupation_sub_item_response.dart';
part 'occupation_response.freezed.dart';
part 'occupation_response.g.dart';
@freezed
class OccupationResponse with _$OccupationResponse{
  const factory OccupationResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'sub_items')  List<OccupationSubItemResponse>? subItems,
}) = _OccupationResponse;
  factory OccupationResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupationResponseFromJson(json);
}