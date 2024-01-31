import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'create_site_state.freezed.dart';

enum CreateSiteStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CreateSiteState with _$CreateSiteState {
  const factory CreateSiteState({
    @Default(CreateSiteStatus.initial) CreateSiteStatus status,
    BaseException? error,
    Map<String,dynamic>? site,
  }) = _CreateSiteState;
}
