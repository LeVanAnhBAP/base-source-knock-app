import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'account_information_state.freezed.dart';

enum AccountInformationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class AccountInformationState with _$AccountInformationState {
  const factory AccountInformationState({
    @Default(AccountInformationStatus.initial) AccountInformationStatus status,
    BaseException? error,
  }) = _AccountInformationState;
}
