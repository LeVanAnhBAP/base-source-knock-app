import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_state.dart';

@injectable
class OnSiteBloc extends Bloc<OnSiteEvent, OnSiteState> {
  OnSiteBloc() : super(const OnSiteState()) {
    on<OnSiteErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    OnSiteErrorOccurred event,
    Emitter<OnSiteState> emit,
  ) {
    emit(state.copyWith(
      status: OnSiteStatus.failure,
    ));
  }
}
