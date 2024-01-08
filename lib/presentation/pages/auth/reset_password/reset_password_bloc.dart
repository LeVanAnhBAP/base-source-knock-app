import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_event.dart';
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_state.dart';

@injectable
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUsecase _resetPasswordUsecase;
  ResetPasswordBloc(this._resetPasswordUsecase)
      : super(const ResetPasswordState()) {
    on<ResetPasswordErrorOccurred>(_onErrorOccurred);

    on<ResetPasswordLoad>(_onResetPassword);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
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
    var either =
        await _resetPasswordUsecase(ResetPassParams(email: event.email));
    either.fold(
        (l) =>
            emit(state.copyWith(status: ResetPasswordStatus.failure, error: l)),
        (r) => emit(state.copyWith(status: ResetPasswordStatus.success)));
  }
}
