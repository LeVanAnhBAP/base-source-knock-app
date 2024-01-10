import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';

part 'on_site_state.freezed.dart';

enum OnSiteStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class OnSiteState with _$OnSiteState {
  const factory OnSiteState({
    @Default(<SiteResponse>[])
    List<SiteResponse> sites,
    @Default(OnSiteStatus.initial) OnSiteStatus status,
    BaseException? error,
  }) = _OnSiteState;
  
}
