import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/invoice/invoice_event.dart';
import 'package:uq_system_app/presentation/pages/invoice/invoice_state.dart';

@injectable
class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc() : super(const InvoiceState()) {
    on<InvoiceErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(InvoiceErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    InvoiceErrorOccurred event,
    Emitter<InvoiceState> emit,
  ) {
    emit(state.copyWith(
      status: InvoiceStatus.failure,
    ));
  }
}
