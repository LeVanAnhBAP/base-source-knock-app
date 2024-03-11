import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/invoice/invoice_bloc.dart';
import 'package:uq_system_app/presentation/pages/invoice/invoice_state.dart';

class InvoiceSelector<T>
    extends BlocSelector<InvoiceBloc, InvoiceState, T> {
  InvoiceSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class InvoiceStatusListener extends BlocListener<InvoiceBloc, InvoiceState> {
  InvoiceStatusListener({
    required Iterable<InvoiceStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
