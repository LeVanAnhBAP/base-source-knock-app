import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'create_account_information_state.freezed.dart';

enum CreateAccountInformationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CreateAccountInformationState with _$CreateAccountInformationState {
  const factory CreateAccountInformationState({
    @Default(CreateAccountInformationStatus.initial) CreateAccountInformationStatus status,
    BaseException? error,
  }) = _CreateAccountInformationState;
}
