import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';

part 'order_details_state.freezed.dart';

enum OrderDetailsStatus {
  initial,
  loading,
  success,
  updated,
  failure,
}

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(0) int totalAfterTax,
    @Default(0) int totalTax,
    @Default(0) int total,
    @Default(0) double taxRate,
    @Default(<PriceOrderDetailModel>[]) List<PriceOrderDetailModel> priceOrders,
    @Default(OrderDetailsStatus.initial) OrderDetailsStatus status,
    BaseException? error,
  }) = _OrderDetailsState;
}
