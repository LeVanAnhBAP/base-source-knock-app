import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'chat_deal_room_state.freezed.dart';

enum ChatDealRoomStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ChatDealRoomState with _$ChatDealRoomState {
  const factory ChatDealRoomState({
    @Default(ChatDealRoomStatus.initial) ChatDealRoomStatus status,
    BaseException? error,
  }) = _ChatDealRoomState;
}
