import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'site_details_state.freezed.dart';

enum SiteDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SiteDetailsState with _$SiteDetailsState {
  const factory SiteDetailsState({
    @Default(SiteDetailsStatus.initial) SiteDetailsStatus status,
    BaseException? error,
  }) = _SiteDetailsState;
}
