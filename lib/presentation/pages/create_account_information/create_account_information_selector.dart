import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_account_information/create_account_information_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_account_information/create_account_information_state.dart';

class CreateAccountInformationSelector<T>
    extends BlocSelector<CreateAccountInformationBloc, CreateAccountInformationState, T> {
  CreateAccountInformationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class CreateAccountInformationStatusListener extends BlocListener<CreateAccountInformationBloc, CreateAccountInformationState> {
  CreateAccountInformationStatusListener({
    required Iterable<CreateAccountInformationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
