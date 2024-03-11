
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deal_room_response.freezed.dart';
part 'deal_room_response.g.dart';
@freezed
class DealRoomResponse with _$DealRoomResponse{
  const factory DealRoomResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'key_collection')  String? keyCollection,
    @JsonKey(name: 'order_company_id')  int? orderCompanyId,
    @JsonKey(name: 'worker_company_id')  int? workerCompanyId,
    @JsonKey(name: 'factory_floor_id')  int? siteId,
    @JsonKey(name: 'factory_floor_order_id')  int? siteOrderId,
    @JsonKey(name: 'type')  int? type,
    @JsonKey(name: 'status')  int? status,
    @JsonKey(name: 'last_message_time')  int? lastMessageTime,
    @JsonKey(name: 'company_name')  String? companyName,
    @JsonKey(name: 'company_logo')  String? companyLogo,
    @JsonKey(name: 'unread_count')  int? unreadCount,
}) = _DealRoomResponse;

  factory DealRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$DealRoomResponseFromJson(json);
}