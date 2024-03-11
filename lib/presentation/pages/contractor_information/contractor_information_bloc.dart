import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/contractor_information/contractor_information_event.dart';
import 'package:uq_system_app/presentation/pages/contractor_information/contractor_information_state.dart';

@injectable
class ContractorInformationBloc extends Bloc<ContractorInformationEvent, ContractorInformationState> {
  ContractorInformationBloc() : super(const ContractorInformationState()) {
    on<ContractorInformationErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ContractorInformationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    ContractorInformationErrorOccurred event,
    Emitter<ContractorInformationState> emit,
  ) {
    emit(state.copyWith(
      status: ContractorInformationStatus.failure,
    ));
  }
}
