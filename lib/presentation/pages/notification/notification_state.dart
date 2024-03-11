import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';

part 'notification_state.freezed.dart';

enum NotificationStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(1) int page,
    @Default([]) List<NotificationResponse> notifications,
    @Default(NotificationStatus.initial) NotificationStatus status,
    BaseException? error,
  }) = _NotificationState;
}
