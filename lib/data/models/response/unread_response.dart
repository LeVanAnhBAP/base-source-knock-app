
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_response.freezed.dart';
part 'unread_response.g.dart';
@freezed
class UnreadResponse with _$UnreadResponse{
  const factory UnreadResponse({
    @JsonKey(name: 'unread_deal_room') required bool unreadDealRoom,
    @JsonKey(name: 'unread_factory_floor_room') required bool unReadFactoryFloorRoom,
    @JsonKey(name: 'unread_notification') required bool unReadNotification,
}) = _UnreadResponse;

  factory UnreadResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadResponseFromJson(json);
}