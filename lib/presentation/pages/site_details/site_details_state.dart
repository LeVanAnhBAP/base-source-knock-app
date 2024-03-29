import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';

part 'site_details_state.freezed.dart';

enum SiteDetailsStatus {
  initial,
  loading,
  success,
  removed,
  failure,
}

@freezed
class SiteDetailsState with _$SiteDetailsState {
  const factory SiteDetailsState({
    SiteDetailsResponse? siteDetails,
    @Default(SiteDetailsStatus.initial) SiteDetailsStatus status,
    BaseException? error,
  }) = _SiteDetailsState;
}
