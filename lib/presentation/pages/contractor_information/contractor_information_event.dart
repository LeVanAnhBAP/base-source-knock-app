import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'contractor_information_event.freezed.dart';

@freezed
class ContractorInformationEvent with _$ContractorInformationEvent {
  const factory ContractorInformationEvent.errorOccurred([BaseException? error]) = ContractorInformationErrorOccurred;
}
