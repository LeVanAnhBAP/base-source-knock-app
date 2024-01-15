import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_state.dart';

class OnSiteStatusSelector
    extends BlocSelector<OnSiteBloc, OnSiteState, OnSiteStatus> {
  OnSiteStatusSelector({
    required Widget Function(OnSiteStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          
          builder: (_, status) => builder(status),
        );
}

class OnSiteStatusListener extends BlocListener<OnSiteBloc, OnSiteState> {
  OnSiteStatusListener(
      {required Iterable<OnSiteStatus> statuses,
      super.key,
      required super.listener,
      required Widget child})
      : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status &&
              statuses.contains(currentState.status),
          child: child,
        );
}
