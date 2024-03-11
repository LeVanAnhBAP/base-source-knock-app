import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/contractor_information/contractor_information_bloc.dart';
import 'package:uq_system_app/presentation/pages/contractor_information/contractor_information_state.dart';

class ContractorInformationSelector<T>
    extends BlocSelector<ContractorInformationBloc, ContractorInformationState, T> {
  ContractorInformationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class ContractorInformationStatusListener extends BlocListener<ContractorInformationBloc, ContractorInformationState> {
  ContractorInformationStatusListener({
    required Iterable<ContractorInformationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
