import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_state.dart';

@injectable
class CreateSiteBloc extends Bloc<CreateSiteEvent, CreateSiteState> {
  CreateSiteBloc() : super(const CreateSiteState()) {
    on<CreateSiteErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateSiteErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    CreateSiteErrorOccurred event,
    Emitter<CreateSiteState> emit,
  ) {
    emit(state.copyWith(
      status: CreateSiteStatus.failure,
    ));
  }
}
