import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_event.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordBloc(this._resetPasswordUseCase)
      : super(const ResetPasswordState()) {
    on<ResetPasswordErrorOccurred>(_onErrorOccurred);

    on<ResetPasswordLoad>(_onResetPassword);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ResetPasswordEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ResetPasswordErrorOccurred event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(state.copyWith(
      status: ResetPasswordStatus.failure,
    ));
  }

  Future<void> _onResetPassword(
      ResetPasswordLoad event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));
    await _resetPasswordUseCase(ResetPassParams(email: event.email));
    emit(state.copyWith(status: ResetPasswordStatus.success));
  }
}
