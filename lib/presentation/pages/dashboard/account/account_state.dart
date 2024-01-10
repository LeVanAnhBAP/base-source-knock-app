import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

import '../../../../data/models/response/account.dart';

part 'account_state.freezed.dart';

enum AccountStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    Account? account,
    @Default(AccountStatus.initial) AccountStatus status,
    BaseException? error,
  }) = _AccountState;
}
