import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_event.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_state.dart';

@injectable
class WorkerMapBloc extends Bloc<WorkerMapEvent, WorkerMapState> {
  WorkerMapBloc() : super(const WorkerMapState()) {
    on<WorkerMapErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(WorkerMapErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    WorkerMapErrorOccurred event,
    Emitter<WorkerMapState> emit,
  ) {
    emit(state.copyWith(
      status: WorkerMapStatus.failure,
    ));
  }
}
