import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_bloc.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_state.dart';

class ContractInformationSelector<T>
    extends BlocSelector<ContractInformationBloc, ContractInformationState, T> {
  ContractInformationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class ContractInformationStatusListener extends BlocListener<ContractInformationBloc, ContractInformationState> {
  ContractInformationStatusListener({
    required Iterable<ContractInformationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
