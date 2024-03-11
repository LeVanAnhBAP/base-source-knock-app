import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_state.dart';

class WorkerMapStatusSelector
    extends BlocSelector<WorkerMapBloc, WorkerMapState, WorkerMapStatus> {
  WorkerMapStatusSelector({
    required Widget Function(WorkerMapStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class WorkerMapStatusListener extends BlocListener<WorkerMapBloc, WorkerMapState> {
  WorkerMapStatusListener({
    required Iterable<WorkerMapStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
