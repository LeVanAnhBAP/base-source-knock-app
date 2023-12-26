import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'chat_state.freezed.dart';

enum ChatStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ChatStatus.initial) ChatStatus status,
    BaseException? error,
  }) = _ChatState;
}
