import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'schedule_details_event.freezed.dart';

@freezed
class ScheduleDetailsEvent with _$ScheduleDetailsEvent {
  const factory ScheduleDetailsEvent.errorOccurred([BaseException? error]) = ScheduleDetailsErrorOccurred;
}
