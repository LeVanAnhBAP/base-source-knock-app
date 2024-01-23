import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart';
import 'package:uq_system_app/presentation/pages/order_details/order_details_state.dart';

class OrderDetailsStatusSelector
    extends BlocSelector<OrderDetailsBloc, OrderDetailsState, OrderDetailsStatus> {
  OrderDetailsStatusSelector({
    required Widget Function(OrderDetailsStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
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
