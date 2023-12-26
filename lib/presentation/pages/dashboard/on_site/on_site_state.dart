import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'on_site_state.freezed.dart';

enum OnSiteStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class OnSiteState with _$OnSiteState {
  const factory OnSiteState({
    @Default(OnSiteStatus.initial) OnSiteStatus status,
    BaseException? error,
  }) = _OnSiteState;
}
