import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';

part 'order_line_event.freezed.dart';

@freezed
class OrderLineEvent with _$OrderLineEvent {
  const factory OrderLineEvent.errorOccurred([BaseException? error]) = OrderLineErrorOccurred;
  const factory OrderLineEvent.updateParams({required PriceOrderDetailModel prams}) = OrderLineUpdateParams;
  const factory OrderLineEvent.updateQuantity({required int? quantity}) = OrderLineUpdateQuantity;
  const factory OrderLineEvent.updateUnitPrice({required int? unitPrice}) = OrderLineUpdateUnitPrice;
}

