import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<ChatErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ChatErrorOccurred event,
    Emitter<ChatState> emit,
  ) {
    emit(state.copyWith(
      status: ChatStatus.failure,
    ));
  }
}
