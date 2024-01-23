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
  }
  FutureOr<void> _onUpdateParams(
      OrderLineUpdateParams event,
      Emitter<OrderLineState> emit,
      ) {
    emit(state.copyWith(
      status: OrderLineStatus.updated,
      params: event.prams
    ));
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
}
