import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_event.dart';
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_state.dart';

@injectable
class ChatDealRoomBloc extends Bloc<ChatDealRoomEvent, ChatDealRoomState> {
  ChatDealRoomBloc() : super(const ChatDealRoomState()) {
    on<ChatDealRoomErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ChatDealRoomErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ChatDealRoomErrorOccurred event,
    Emitter<ChatDealRoomState> emit,
  ) {
    emit(state.copyWith(
      status: ChatDealRoomStatus.failure,
    ));
  }
}
