import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'account_information_event.freezed.dart';

@freezed
class AccountInformationEvent with _$AccountInformationEvent {
  const factory AccountInformationEvent.errorOccurred([BaseException? error]) = AccountInformationErrorOccurred;
}
