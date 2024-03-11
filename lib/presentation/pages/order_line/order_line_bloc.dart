import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_event.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_state.dart';

@injectable
class OrderLineBloc extends Bloc<OrderLineEvent, OrderLineState> {
  OrderLineBloc() : super(const OrderLineState()) {
    on<OrderLineErrorOccurred>(_onErrorOccurred);
    on<OrderLineUpdateParams>(_onUpdateParams);
    on<OrderLineUpdateQuantity>(_onUpdateQuantity);
    on<OrderLineUpdateUnitPrice>(_onUpdateUnitPrice);
  }

  FutureOr<void> _onUpdateUnitPrice(
    OrderLineUpdateUnitPrice event,
    Emitter<OrderLineState> emit,
  ) async {
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        params: state.params.copyWith(priceUnit: event.unitPrice),
        total: (event.unitPrice ?? 0) * (state.params.quantity ?? 0),
        isValidate: isPramsValidate()));
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        isValidate: isPramsValidate()));
  }

  FutureOr<void> _onUpdateQuantity(
    OrderLineUpdateQuantity event,
    Emitter<OrderLineState> emit,
  ) async {
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        params: state.params.copyWith(quantity: event.quantity),
        total: (event.quantity ?? 0) * (state.params.priceUnit ?? 0),
        ));
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        isValidate: isPramsValidate()));
  }

  FutureOr<void> _onUpdateParams(
    OrderLineUpdateParams event,
    Emitter<OrderLineState> emit,
  ) {
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        params: event.prams,
        isValidate: isPramsValidate()));
    emit(state.copyWith(
        status: OrderLineStatus.updated,
        isValidate: isPramsValidate()));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OrderLineErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    OrderLineErrorOccurred event,
    Emitter<OrderLineState> emit,
  ) {
    emit(state.copyWith(
      status: OrderLineStatus.failure,
    ));
  }

  bool isPramsValidate() {
    bool allFieldsValidate = [
      state.params.priceUnit,
      state.params.quantity,
      state.params.unit,
      state.params.name,
      state.params.specifications,
    ].every((element) => element != null);
    return allFieldsValidate;
  }
}
