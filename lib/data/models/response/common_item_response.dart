
import 'package:freezed_annotation/freezed_annotation.dart';
part 'common_item_response.freezed.dart';
part 'common_item_response.g.dart';
@freezed
class CommonItemResponse with _$CommonItemResponse{
  const factory CommonItemResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
}) = _CommonItemResponse;
  factory CommonItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonItemResponseFromJson(json);
}