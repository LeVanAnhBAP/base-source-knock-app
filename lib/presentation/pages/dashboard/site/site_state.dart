import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'site_state.freezed.dart';

enum SiteStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SiteState with _$SiteState {
  const factory SiteState({
    @Default(SiteStatus.initial) SiteStatus status,
    BaseException? error,
    List<dynamic>? listSite,
  }) = _SiteState;
}
