

import 'package:freezed_annotation/freezed_annotation.dart';

part 'occupation_sub_item_response.freezed.dart';
part 'occupation_sub_item_response.g.dart';
@freezed
class OccupationSubItemResponse with _$OccupationSubItemResponse{
  const factory OccupationSubItemResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'occupation_major_item_id') required int occMajorItemId,
    @JsonKey(name: 'name') required String name,
  }) = _OccupationSubItemResponse;
    factory OccupationSubItemResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupationSubItemResponseFromJson(json);
}