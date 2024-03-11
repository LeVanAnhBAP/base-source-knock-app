import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/company_nearby_params.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/usecases/site/get_companies_nearby_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_event.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_state.dart';

@injectable
class WorkerMapBloc extends Bloc<WorkerMapEvent, WorkerMapState> {
  final GetSiteDetailsUseCase _getSiteDetailsUseCase;
  final GetCompaniesNearbyUseCase _getCompaniesNearbyUseCase;

  WorkerMapBloc(this._getSiteDetailsUseCase, this._getCompaniesNearbyUseCase)
      : super(const WorkerMapState()) {
    on<WorkerMapErrorOccurred>(_onErrorOccurred);
    on<WorkerMapLoadData>(_onLoadData);
  }

  FutureOr<void> _onLoadData(
      WorkerMapLoadData event, Emitter<WorkerMapState> emit) async {
    emit(state.copyWith(status: WorkerMapStatus.loading));
    EasyLoading.show();
    await Future.wait([
      _getSiteDetailsUseCase(event.siteId),
      _getCompaniesNearbyUseCase(CompanyNearbyParams(
          siteId: event.siteId, distance: state.distance))
    ]).then((value){
      EasyLoading.dismiss();
      emit(state.copyWith(status: WorkerMapStatus.success,
        siteDetails: value[0] as SiteDetailsResponse,
        companiesNearby: value[1] as List<CompanyResponse>
      ));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(WorkerMapErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    WorkerMapErrorOccurred event,
    Emitter<WorkerMapState> emit,
  ) {
    if (EasyLoading.isShow) EasyLoading.dismiss();
    emit(state.copyWith(
      status: WorkerMapStatus.failure,
    ));
  }
}
