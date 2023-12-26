import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_state.dart';

class ResetPasswordStatusSelector
    extends BlocSelector<ResetPasswordBloc, ResetPasswordState, ResetPasswordStatus> {
  ResetPasswordStatusSelector({
    required Widget Function(ResetPasswordStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class ResetPasswordStatusListener extends BlocListener<ResetPasswordBloc, ResetPasswordState> {
  ResetPasswordStatusListener({
    required Iterable<ResetPasswordStatus> statuses,
    super.key,
    required super.listener,
    required Widget child,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
          child: child
        );
}
