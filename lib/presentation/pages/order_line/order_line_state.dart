import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/price_order_detail_params.dart';

part 'order_line_state.freezed.dart';

enum OrderLineStatus {
  initial,
  loading,
  success,
  updated,
  failure,
}

@freezed
class OrderLineState with _$OrderLineState {
  const factory OrderLineState({
    @Default(PriceOrderDetailParams()) PriceOrderDetailParams params,
    @Default(OrderLineStatus.initial) OrderLineStatus status,
    BaseException? error,
  }) = _OrderLineState;
}
