import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_event.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_state.dart';

@injectable
class ContractInformationBloc extends Bloc<ContractInformationEvent, ContractInformationState> {
  ContractInformationBloc() : super(const ContractInformationState()) {
    on<ContractInformationErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ContractInformationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ContractInformationErrorOccurred event,
    Emitter<ContractInformationState> emit,
  ) {
    emit(state.copyWith(
      status: ContractInformationStatus.failure,
    ));
  }
}
