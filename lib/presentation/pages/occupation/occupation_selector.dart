import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_state.dart';

class OccupationSelector
    extends BlocSelector<OccupationBloc, OccupationState, List<OccupationMajorResponse>> {
  OccupationSelector({
    required Widget Function(List<OccupationMajorResponse> data) builder,
  }) : super(
          selector: (state) => state.searchedOccupation,
          builder: (_, data) => builder(data),
        );
}

class OccupationStatusListener extends BlocListener<OccupationBloc, OccupationState> {
  OccupationStatusListener({
    required Iterable<OccupationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
