import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_state.dart';

class OrderDetailsSelector<T>
    extends BlocSelector<OrderDetailsBloc, OrderDetailsState, T> {
  OrderDetailsSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class OrderDetailsStatusListener extends BlocListener<OrderDetailsBloc, OrderDetailsState> {
  OrderDetailsStatusListener({
    required Iterable<OrderDetailsStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
