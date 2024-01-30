import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'system_notify_event.freezed.dart';

@freezed
class SystemNotifyEvent with _$SystemNotifyEvent {
  const factory SystemNotifyEvent.errorOccurred([BaseException? error]) = SystemNotifyErrorOccurred;
  const factory SystemNotifyEvent.loadUnread() = SystemNotifyLoadUnread;
}
