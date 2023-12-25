import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    Account? account,
    @Default(AuthStatus.initial) AuthStatus authStatus,
    BaseException? error,
  }) = _AuthState;
}
