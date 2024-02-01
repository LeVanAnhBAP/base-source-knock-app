
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/models/response/site_order_response.dart';
part 'notification_response.freezed.dart';
part 'notification_response.g.dart';
@freezed
class NotificationResponse with _$NotificationResponse{
  const factory NotificationResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title')  String? title,
    @JsonKey(name : 'type') required int type,
    @JsonKey(name : 'seen_flag') required int seenFlag,
    @JsonKey(name: 'content')  String? content,
    @JsonKey(name: 'created_at')  String? createAt,
    @JsonKey(name: 'room_id')  int? roomId,
    @JsonKey(name: 'factory_floor')  SiteDetailsResponse? site,
    @JsonKey(name: 'factory_floor_order')  SiteOrderResponse? siteOrder,
  }) = _NotificationResponse;
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}