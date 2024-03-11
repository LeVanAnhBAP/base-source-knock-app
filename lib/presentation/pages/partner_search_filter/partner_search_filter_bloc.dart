import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/partner_search_filter/partner_search_filter_event.dart';
import 'package:uq_system_app/presentation/pages/partner_search_filter/partner_search_filter_state.dart';

@injectable
class PartnerSearchFilterBloc extends Bloc<PartnerSearchFilterEvent, PartnerSearchFilterState> {
  PartnerSearchFilterBloc() : super(const PartnerSearchFilterState()) {
    on<PartnerSearchFilterErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PartnerSearchFilterErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    PartnerSearchFilterErrorOccurred event,
    Emitter<PartnerSearchFilterState> emit,
  ) {
    emit(state.copyWith(
      status: PartnerSearchFilterStatus.failure,
    ));
  }
}
