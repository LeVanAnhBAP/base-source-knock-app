
import 'package:freezed_annotation/freezed_annotation.dart';
part 'json_image_response.freezed.dart';
part 'json_image_response.g.dart';
@freezed
class JsonImageResponse with _$JsonImageResponse{
  const factory JsonImageResponse({
    @JsonKey(name: 'img')
    @Default([])
    List<String> images,
    @JsonKey(name: 'actual_expense')
    @Default(0)
    int actualExpense,
}) = _JsonImageResponse;
  factory JsonImageResponse.fromJson(Map<String, dynamic> json) =>
      _$JsonImageResponseFromJson(json);
}