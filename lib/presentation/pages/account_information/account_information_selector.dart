import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/account_information/account_information_bloc.dart';
import 'package:uq_system_app/presentation/pages/account_information/account_information_state.dart';

class AccountInformationSelector<T>
    extends BlocSelector<AccountInformationBloc, AccountInformationState, T> {
  AccountInformationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class AccountInformationStatusListener extends BlocListener<AccountInformationBloc, AccountInformationState> {
  AccountInformationStatusListener({
    required Iterable<AccountInformationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
