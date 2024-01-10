import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account_state.dart';

import '../../../../data/usecases/user/get_account_usecase.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountUseCase _getAccountUseCase;
  AccountBloc(this._getAccountUseCase) : super(const AccountState()) {
    on<AccountErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AccountEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }
  FutureOr<void> _onLoad(AccountLoad event, Emitter<AccountState> emit) async{

  }
  FutureOr<void> _onErrorOccurred(
    AccountErrorOccurred event,
    Emitter<AccountState> emit,
  ) {
    emit(state.copyWith(
      status: AccountStatus.failure,
    ));
  }
}
