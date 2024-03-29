import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'contract_information_event.freezed.dart';

@freezed
class ContractInformationEvent with _$ContractInformationEvent {
  const factory ContractInformationEvent.errorOccurred([BaseException? error]) = ContractInformationErrorOccurred;
}
