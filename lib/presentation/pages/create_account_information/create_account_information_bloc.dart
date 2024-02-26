import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/create_account_information/create_account_information_event.dart';
import 'package:uq_system_app/presentation/pages/create_account_information/create_account_information_state.dart';

@injectable
class CreateAccountInformationBloc extends Bloc<CreateAccountInformationEvent, CreateAccountInformationState> {
  CreateAccountInformationBloc() : super(const CreateAccountInformationState()) {
    on<CreateAccountInformationErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateAccountInformationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    CreateAccountInformationErrorOccurred event,
    Emitter<CreateAccountInformationState> emit,
  ) {
    emit(state.copyWith(
      status: CreateAccountInformationStatus.failure,
    ));
  }
}
