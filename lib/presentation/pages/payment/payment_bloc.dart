import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/payment/payment_event.dart';
import 'package:uq_system_app/presentation/pages/payment/payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PaymentErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    PaymentErrorOccurred event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(
      status: PaymentStatus.failure,
    ));
  }
}
