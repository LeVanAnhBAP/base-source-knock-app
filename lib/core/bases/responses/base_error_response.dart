
import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_error_response.freezed.dart';
part 'base_error_response.g.dart';
@freezed
class BaseErrorResponse with _$BaseErrorResponse{
  const factory BaseErrorResponse({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name : 'message')
    @Default([])
    List<String> messages,
}) = _BaseErrorResponse;
  factory BaseErrorResponse.fromJson(Map<String, Object?> json) =>
      _$BaseErrorResponseFromJson(json);
}