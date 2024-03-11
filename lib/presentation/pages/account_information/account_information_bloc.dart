import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/account_information/account_information_event.dart';
import 'package:uq_system_app/presentation/pages/account_information/account_information_state.dart';

@injectable
class AccountInformationBloc extends Bloc<AccountInformationEvent, AccountInformationState> {
  AccountInformationBloc() : super(const AccountInformationState()) {
    on<AccountInformationErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AccountInformationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    AccountInformationErrorOccurred event,
    Emitter<AccountInformationState> emit,
  ) {
    emit(state.copyWith(
      status: AccountInformationStatus.failure,
    ));
  }
}
