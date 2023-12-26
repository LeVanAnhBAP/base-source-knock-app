import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_state.dart';

class ChatStatusSelector
    extends BlocSelector<ChatBloc, ChatState, ChatStatus> {
  ChatStatusSelector({
    required Widget Function(ChatStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class ChatStatusListener extends BlocListener<ChatBloc, ChatState> {
  ChatStatusListener({
    required Iterable<ChatStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
