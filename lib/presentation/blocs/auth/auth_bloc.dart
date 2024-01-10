import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart';
import 'package:uq_system_app/data/usecases/auth/logout.dart';
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart';

import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Logout _logout;
  final LoginUseCase _loginUseCase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  AuthBloc(this._logout, this._loginUseCase, this._resetPasswordUsecase)
      : super(const AuthState()) {
    on<AuthLoggedOut>(_onLoggedOut);
    on<AuthLogin>(_onLoggin);
    on<AuthResetPassword>(_onResetPassword);
  }

  Future<void> _onLoggedOut(
      AuthLoggedOut event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(authStatus: AuthStatus.loading));

      await _logout();

      emit(state.copyWith(
        account: null,
        error: event.error,
      ));
    } catch (error) {
      emit(state.copyWith(
        error: BaseException.from(error),
        authStatus: AuthStatus.failure,
      ));
    }
  }

  Future<void> _onLoggin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    var either = await _loginUseCase(event.loginParams);
    either.fold(
        (l) => emit(state.copyWith(authStatus: AuthStatus.failure, error: l)),
        (r) => emit(state.copyWith(authStatus: AuthStatus.success)));
  }

  Future<void> _onResetPassword(
      AuthResetPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    var either = await _resetPasswordUsecase(ResetPassParams(email: event.email));
     either.fold(
        (l) => emit(state.copyWith(authStatus: AuthStatus.failure, error: l)),
        (r) => emit(state.copyWith(authStatus: AuthStatus.success)));
  }
}
