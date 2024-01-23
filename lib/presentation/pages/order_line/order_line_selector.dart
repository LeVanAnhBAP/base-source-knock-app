import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_line/order_line_state.dart';

class OrderLineStatusSelector
    extends BlocSelector<OrderLineBloc, OrderLineState, OrderLineStatus> {
  OrderLineStatusSelector({
    required Widget Function(OrderLineStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}
class OrderLineSelector<T>
    extends BlocSelector<OrderLineBloc, OrderLineState, T> {
  OrderLineSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
    builder: (_, data) => builder(data),
  );
}
class OrderLineStatusListener extends BlocListener<OrderLineBloc, OrderLineState> {
  OrderLineStatusListener({
    required Iterable<OrderLineStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
