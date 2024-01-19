import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'site_details_state.freezed.dart';

enum SiteDetailsStatus {
  initial,
  loading,
  success,
  failure,
  refreshing,
}
@JsonSerializable()
@freezed
class SiteDetailsState with _$SiteDetailsState {
   factory SiteDetailsState({
    @Default(SiteDetailsStatus.initial) SiteDetailsStatus status,
    BaseException? error,
    Map<String,dynamic>?siteDetail,
  }) = _SiteDetailsState;
}
