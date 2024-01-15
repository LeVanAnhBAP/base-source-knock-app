
import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_chat_deal_response.freezed.dart';
part 'room_chat_deal_response.g.dart';
@freezed
class RoomChatDealResponse with _$RoomChatDealResponse{
  const factory  RoomChatDealResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'order_company_id') required int orderCompanyId,
    @JsonKey(name: 'worker_company_id') required int workerCompanyId,
}) = _RoomChatDealResponse;
factory RoomChatDealResponse.fromJson(Map<String, dynamic> json) =>
_$RoomChatDealResponseFromJson(json);
}