import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_state.dart';

class SiteDetailsStatusSelector
    extends BlocSelector<SiteDetailsBloc, SiteDetailsState, SiteDetailsStatus> {
  SiteDetailsStatusSelector({
    required Widget Function(SiteDetailsStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class SiteDetailsStatusListener extends BlocListener<SiteDetailsBloc, SiteDetailsState> {
  SiteDetailsStatusListener({
    required Iterable<SiteDetailsStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
