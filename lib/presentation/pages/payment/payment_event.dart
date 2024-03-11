import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'payment_event.freezed.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.errorOccurred([BaseException? error]) = PaymentErrorOccurred;
}
