import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'schedule_details_state.freezed.dart';

enum ScheduleDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ScheduleDetailsState with _$ScheduleDetailsState {
  const factory ScheduleDetailsState({
    @Default(ScheduleDetailsStatus.initial) ScheduleDetailsStatus status,
    BaseException? error,
  }) = _ScheduleDetailsState;
}
