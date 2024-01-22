import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'profile_event.freezed.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.errorOccurred([BaseException? error]) =
      AccountErrorOccurred;
  const factory AccountEvent.getDataStarted({String? accessToken}) = AccountGetDataStarted;
}
