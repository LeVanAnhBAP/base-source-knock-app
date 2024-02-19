import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';

part 'order_details_event.freezed.dart';

@freezed
class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.errorOccurred([BaseException? error]) = OrderDetailsErrorOccurred;
  const factory OrderDetailsEvent.add({required PriceOrderDetailModel params}) = OrderDetailsAdd;
  const factory OrderDetailsEvent.update({required PriceOrderDetailModel params, required int index}) = OrderDetailsUpdate;
  const factory OrderDetailsEvent.initData({required List<PriceOrderDetailModel> orders,required double tax}) = OrderDetailsInitData;
}