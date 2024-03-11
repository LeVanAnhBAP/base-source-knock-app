import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'create_account_information_event.freezed.dart';

@freezed
class CreateAccountInformationEvent with _$CreateAccountInformationEvent {
  const factory CreateAccountInformationEvent.errorOccurred([BaseException? error]) = CreateAccountInformationErrorOccurred;
}
