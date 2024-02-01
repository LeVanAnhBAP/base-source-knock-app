import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

import '../../../data/models/response/unread_response.dart';

part 'system_notify_state.freezed.dart';

enum SystemNotifyStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SystemNotifyState with _$SystemNotifyState {
  const factory SystemNotifyState({
    UnreadResponse? unreadResponse,
    @Default(SystemNotifyStatus.initial) SystemNotifyStatus status,
    BaseException? error,
  }) = _SystemNotifyState;
}
