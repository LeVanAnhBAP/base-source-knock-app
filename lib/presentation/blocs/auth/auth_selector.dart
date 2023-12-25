import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AuthListener extends BlocListener<AuthBloc, AuthState> {
  AuthListener({
    super.key,
    required super.listener,
    required Widget child,
  }) : super(
          listenWhen: (previousState, state) =>
              previousState.authStatus != state.authStatus,
          child: child,
        );
}
