
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_response.freezed.dart';
part 'notification_response.g.dart';
@freezed
class NotificationResponse with _$NotificationResponse{
  const factory NotificationResponse({
    required int id,
    required String title,
    required String content,
    required int createAt,
    required String company,
  }) = _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}