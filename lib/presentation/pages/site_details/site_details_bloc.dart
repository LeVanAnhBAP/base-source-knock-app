import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_event.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_state.dart';

@injectable
class SiteDetailsBloc extends Bloc<SiteDetailsEvent, SiteDetailsState> {
  SiteDetailsBloc() : super(const SiteDetailsState()) {
    on<SiteDetailsErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SiteDetailsErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    SiteDetailsErrorOccurred event,
    Emitter<SiteDetailsState> emit,
  ) {
    emit(state.copyWith(
      status: SiteDetailsStatus.failure,
    ));
  }
}
