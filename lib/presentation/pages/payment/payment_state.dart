import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'payment_state.freezed.dart';

enum PaymentStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(PaymentStatus.initial) PaymentStatus status,
    BaseException? error,
  }) = _PaymentState;
}
