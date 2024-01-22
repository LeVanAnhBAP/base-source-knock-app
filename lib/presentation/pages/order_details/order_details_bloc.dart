import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_event.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_state.dart';

@injectable
class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(const OrderDetailsState()) {
    on<OrderDetailsErrorOccurred>(_onErrorOccurred);
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
