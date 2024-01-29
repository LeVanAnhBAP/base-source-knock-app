import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/constants/constants.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';

part 'worker_map_state.freezed.dart';

enum WorkerMapStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class WorkerMapState with _$WorkerMapState {
  const factory WorkerMapState({
    SiteDetailsResponse? siteDetails,
    @Default([]) List<CompanyResponse> companiesNearby,
    @Default(defaultWorkerSearchDistance) int distance,
    @Default(WorkerMapStatus.initial) WorkerMapStatus status,
    BaseException? error,
  }) = _WorkerMapState;
}
