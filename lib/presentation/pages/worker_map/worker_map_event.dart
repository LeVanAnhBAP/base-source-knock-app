import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'worker_map_event.freezed.dart';

@freezed
class WorkerMapEvent with _$WorkerMapEvent {
  const factory WorkerMapEvent.errorOccurred([BaseException? error]) = WorkerMapErrorOccurred;
}
