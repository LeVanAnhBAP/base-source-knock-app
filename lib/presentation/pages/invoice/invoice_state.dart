import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'invoice_state.freezed.dart';

enum InvoiceStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class InvoiceState with _$InvoiceState {
  const factory InvoiceState({
    @Default(InvoiceStatus.initial) InvoiceStatus status,
    BaseException? error,
  }) = _InvoiceState;
}
