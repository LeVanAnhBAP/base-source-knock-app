import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'partner_search_filter_state.freezed.dart';

enum PartnerSearchFilterStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class PartnerSearchFilterState with _$PartnerSearchFilterState {
  const factory PartnerSearchFilterState({
    @Default(PartnerSearchFilterStatus.initial) PartnerSearchFilterStatus status,
    BaseException? error,
  }) = _PartnerSearchFilterState;
}
