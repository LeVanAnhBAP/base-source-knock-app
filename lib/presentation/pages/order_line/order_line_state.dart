import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';

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
    @Default(false) bool isValidate,
    @Default(PriceOrderDetailModel()) PriceOrderDetailModel params,
    @Default(0) int total,
    @Default(OrderLineStatus.initial) OrderLineStatus status,
    BaseException? error,
  }) = _OrderLineState;
}
