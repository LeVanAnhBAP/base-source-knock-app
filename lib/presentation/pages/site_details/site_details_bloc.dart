import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_event.dart';
import 'package:uq_system_app/presentation/pages/site_details/site_details_state.dart';

@injectable
class SiteDetailsBloc extends Bloc<SiteDetailsEvent, SiteDetailsState> {
  final GetSiteDetailsUseCase _getSiteDetailsUseCase;

  SiteDetailsBloc(this._getSiteDetailsUseCase) : super(const SiteDetailsState()) {
    on<SiteDetailsErrorOccurred>(_onErrorOccurred);
    on<SiteDetailsLoadData>(_onLoadData);
  }
  FutureOr<void> _onLoadData(
      SiteDetailsLoadData event,
      Emitter<SiteDetailsState> emit,
      ) async {
    EasyLoading.show();
    var result = await _getSiteDetailsUseCase(event.siteId);
    EasyLoading.dismiss();
    emit(state.copyWith(
      status: SiteDetailsStatus.success,
      siteDetails: result
    ));
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
    if (EasyLoading.isShow) EasyLoading.dismiss();
    emit(state.copyWith(
      status: SiteDetailsStatus.failure,
    ));
  }
}
