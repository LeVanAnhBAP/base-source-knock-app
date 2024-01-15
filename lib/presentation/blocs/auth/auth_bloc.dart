import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart';
import 'package:uq_system_app/data/usecases/auth/logout.dart';
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart';

import 'package:uq_system_app/presentation/blocs/auth/auth_event.dart';
import 'package:uq_system_app/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/usecases/user/get_account_usecase.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Logout _logout;
  final LoginUseCase _loginUseCase;
  final GetAccountUseCase _getAccountUseCase;
  final UpdateAvatarUseCase _updateAvatarUseCase;
  AuthBloc(this._logout, this._loginUseCase, this._getAccountUseCase, this._updateAvatarUseCase)
      : super(const AuthState()) {
    on<AuthEventErrorOccurred>(_onErrorOccurred);
    on<AuthLoggedOut>(_onLoggedOut);
    on<AuthLogin>(_onLogin);
    on<AuthLoadAccount>(_onLoadAccount);
    on<AuthUpdateAvatar>(_onUpdateAvatar);
  }
  FutureOr<void> _onErrorOccurred(
      AuthEventErrorOccurred event,
      Emitter<AuthState> emit,
      ) {
    emit(state.copyWith(authStatus: AuthStatus.failure, error: event.error));
  }
  FutureOr<void> _onUpdateAvatar(AuthUpdateAvatar event,Emitter<AuthState> emit) async{
    await _updateAvatarUseCase(event.avatar);
    add(const AuthLoadAccount());
  }
  FutureOr<void> _onLoadAccount(AuthLoadAccount event, Emitter<AuthState> emit) async{
    emit(state.copyWith(authStatus: AuthStatus.loading));
    var account = await _getAccountUseCase();
    emit(state.copyWith(authStatus: AuthStatus.success, account: account));
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

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AuthEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    var result = await _loginUseCase(event.loginParams);
    emit(state.copyWith(authStatus: AuthStatus.success, account: result));
  }

}
