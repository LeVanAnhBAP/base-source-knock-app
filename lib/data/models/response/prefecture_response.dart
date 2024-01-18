
import 'package:freezed_annotation/freezed_annotation.dart';
part 'prefecture_response.freezed.dart';
part 'prefecture_response.g.dart';
@freezed
class PrefectureResponse with _$PrefectureResponse{
  const factory PrefectureResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'created_at')  String? createdAt,
    @JsonKey(name: 'updated_at')  String? updatedAt,
    @JsonKey(name: 'deleted_at')  String? deletedAt,
}) = _PrefectureResponse;
  factory PrefectureResponse.fromJson(Map<String, dynamic> json) =>
      _$PrefectureResponseFromJson(json);
}