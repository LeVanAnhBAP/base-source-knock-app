import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';

part 'search_state.freezed.dart';

enum SearchStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(<PartnerResponse>[])
    List<PartnerResponse> partners,
    @Default(SearchStatus.initial) SearchStatus status,
    BaseException? error,
  }) = _SearchState;
}
