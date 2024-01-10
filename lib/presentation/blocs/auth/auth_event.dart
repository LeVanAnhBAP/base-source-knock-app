import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
    const factory AuthEvent.errorOccurred([BaseException? error]) = AuthEventErrorOccurred;
  const factory AuthEvent.login(LoginParams loginParams) = AuthLogin;

  const factory AuthEvent.loggedOut([BaseException? error]) = AuthLoggedOut;

  const factory AuthEvent.loadAccount() = AuthLoadAccount;

}
