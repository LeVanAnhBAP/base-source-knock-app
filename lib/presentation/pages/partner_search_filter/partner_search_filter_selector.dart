import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/partner_search_filter/partner_search_filter_bloc.dart';
import 'package:uq_system_app/presentation/pages/partner_search_filter/partner_search_filter_state.dart';

class PartnerSearchFilterSelector<T>
    extends BlocSelector<PartnerSearchFilterBloc, PartnerSearchFilterState, T> {
  PartnerSearchFilterSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class PartnerSearchFilterStatusListener extends BlocListener<PartnerSearchFilterBloc, PartnerSearchFilterState> {
  PartnerSearchFilterStatusListener({
    required Iterable<PartnerSearchFilterStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
