import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'contractor_information_state.freezed.dart';

enum ContractorInformationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class ContractorInformationState with _$ContractorInformationState {
  const factory ContractorInformationState({
    @Default(ContractorInformationStatus.initial) ContractorInformationStatus status,
    BaseException? error,
  }) = _ContractorInformationState;
}
