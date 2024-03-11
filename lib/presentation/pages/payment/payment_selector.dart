import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/payment/payment_bloc.dart';
import 'package:uq_system_app/presentation/pages/payment/payment_state.dart';

class PaymentSelector<T>
    extends BlocSelector<PaymentBloc, PaymentState, T> {
  PaymentSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class PaymentStatusListener extends BlocListener<PaymentBloc, PaymentState> {
  PaymentStatusListener({
    required Iterable<PaymentStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
