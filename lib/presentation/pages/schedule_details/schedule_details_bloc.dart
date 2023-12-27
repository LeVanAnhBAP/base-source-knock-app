import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_event.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_state.dart';

@injectable
class ScheduleDetailsBloc extends Bloc<ScheduleDetailsEvent, ScheduleDetailsState> {
  ScheduleDetailsBloc() : super(const ScheduleDetailsState()) {
    on<ScheduleDetailsErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ScheduleDetailsErrorOccurred event,
    Emitter<ScheduleDetailsState> emit,
  ) {
    emit(state.copyWith(
      status: ScheduleDetailsStatus.failure,
    ));
  }
}
