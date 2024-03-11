import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'contract_information_state.freezed.dart';

enum ContractInformationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ContractInformationState with _$ContractInformationState {
  const factory ContractInformationState({
    @Default(ContractInformationStatus.initial) ContractInformationStatus status,
    BaseException? error,
  }) = _ContractInformationState;
}
