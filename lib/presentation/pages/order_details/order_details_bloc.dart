import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_event.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_state.dart';

@injectable
class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(const OrderDetailsState()) {
    on<OrderDetailsErrorOccurred>(_onErrorOccurred);
    on<OrderDetailsInitData>(_onInitData);
    on<OrderDetailsUpdate>(_onUpdate);
    on<OrderDetailsAdd>(_onAdd);
  }

  FutureOr<void> _onInitData(
    OrderDetailsInitData event,
    Emitter<OrderDetailsState> emit,
  ) {
    emit(state.copyWith(
        status: OrderDetailsStatus.updated,
        taxRate: event.tax));
    _updateState(event.orders, emit);
  }

  FutureOr<void> _onAdd(
    OrderDetailsAdd event,
    Emitter<OrderDetailsState> emit,
  ) {
    var newPriceOrders = [...state.priceOrders, event.params];
    _updateState(newPriceOrders, emit);
  }

  FutureOr<void> _onUpdate(
    OrderDetailsUpdate event,
    Emitter<OrderDetailsState> emit,
  ) {
    var newPriceOrders = List<PriceOrderDetailModel>.from(state.priceOrders);
    newPriceOrders[event.index] = event.params;
    _updateState(newPriceOrders, emit);
  }
  FutureOr<void> _updateState(
      List<PriceOrderDetailModel> newPriceOrders,
      Emitter<OrderDetailsState> emit,
      ) async{
    var total = newPriceOrders.fold<int>(
        0, (sum, element) => sum + element.quantity! * element.priceUnit!);
    var totalTax = total * state.taxRate ~/ 100;
    emit(state.copyWith(
      status: OrderDetailsStatus.updated,
      priceOrders: List.unmodifiable(newPriceOrders),
      total: total,
      totalTax: totalTax,
      totalAfterTax: totalTax + total,
    ));
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OrderDetailsErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    OrderDetailsErrorOccurred event,
    Emitter<OrderDetailsState> emit,
  ) {
    emit(state.copyWith(
      status: OrderDetailsStatus.failure,
    ));
  }
}
