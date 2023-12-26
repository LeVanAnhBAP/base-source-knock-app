import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'reset_password_event.freezed.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.errorOccurred([BaseException? error]) = ResetPasswordErrorOccurred;
  const factory ResetPasswordEvent.load(String email) = ResetPasswordLoad;
}
