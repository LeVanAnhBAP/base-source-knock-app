import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_event.dart';
import 'package:uq_system_app/presentation/pages/occupation/occupation_state.dart';

@injectable
class OccupationBloc extends Bloc<OccupationEvent, OccupationState> {
  OccupationBloc() : super(const OccupationState()) {
    on<OccupationErrorOccurred>(_onErrorOccurred);
    on<OccupationReceiveData>(_onReceiveData);
    on<OccupationSearch>(_onSearch);
  }

  FutureOr<void> _onReceiveData(
      OccupationReceiveData event, Emitter<OccupationState> emit) {
    emit(state.copyWith(
        status: OccupationStatus.success,
        searchedOccupation: event.occupations,
        occupations: event.occupations));
  }

  FutureOr<void> _onSearch(
      OccupationSearch event, Emitter<OccupationState> emit) async {
    var result = state.occupations
        .where((element) =>
            element.subItems?.indexWhere((element) =>
                element.name.toLowerCase().contains(event.searchText)) !=
            -1)
        .toList();
    emit(state.copyWith(status: OccupationStatus.success, searchedOccupation: result));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OccupationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    OccupationErrorOccurred event,
    Emitter<OccupationState> emit,
  ) {
    emit(state.copyWith(
      status: OccupationStatus.failure,
    ));
  }
}
