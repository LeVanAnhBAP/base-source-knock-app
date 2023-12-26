import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'reset_password_state.freezed.dart';

enum ResetPasswordStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(ResetPasswordStatus.initial) ResetPasswordStatus status,
    BaseException? error,
  }) = _ResetPasswordState;
}
