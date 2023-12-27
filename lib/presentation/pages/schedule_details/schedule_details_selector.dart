import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_state.dart';

class ScheduleDetailsStatusSelector
    extends BlocSelector<ScheduleDetailsBloc, ScheduleDetailsState, ScheduleDetailsStatus> {
  ScheduleDetailsStatusSelector({
    required Widget Function(ScheduleDetailsStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class ScheduleDetailsStatusListener extends BlocListener<ScheduleDetailsBloc, ScheduleDetailsState> {
  ScheduleDetailsStatusListener({
    required Iterable<ScheduleDetailsStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
