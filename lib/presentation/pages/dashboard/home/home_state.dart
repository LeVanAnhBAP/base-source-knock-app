import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  loadingSites,
  success,
  failure,
  refreshing,
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    DateTime? startDayRequest,
    @Default(<SiteResponse>[])
    List<SiteResponse> sites,
    @Default(HomeStatus.initial) HomeStatus status,
    BaseException? error,
  }) = _HomeState;
}
