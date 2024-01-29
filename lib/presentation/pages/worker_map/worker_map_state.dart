import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'worker_map_state.freezed.dart';

enum WorkerMapStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class WorkerMapState with _$WorkerMapState {
  const factory WorkerMapState({
    @Default(WorkerMapStatus.initial) WorkerMapStatus status,
    BaseException? error,
  }) = _WorkerMapState;
}
