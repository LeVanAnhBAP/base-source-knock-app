import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'chat_deal_room_event.freezed.dart';

@freezed
class ChatDealRoomEvent with _$ChatDealRoomEvent {
  const factory ChatDealRoomEvent.errorOccurred([BaseException? error]) = ChatDealRoomErrorOccurred;
}
