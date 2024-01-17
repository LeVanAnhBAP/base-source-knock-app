
import 'package:freezed_annotation/freezed_annotation.dart';
part 'occupation_response.freezed.dart';
part 'occupation_response.g.dart';
@freezed
class OccupationResponse with _$OccupationResponse{
  const factory OccupationResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'sub_items') required List<OccupationResponse> subItems,
}) = _OccupationResponse;
  factory OccupationResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupationResponseFromJson(json);
}