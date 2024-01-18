import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'search_member_state.freezed.dart';

enum SearchMemberStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class SearchMemberState with _$SearchMemberState {
  const factory SearchMemberState({
    @Default(SearchMemberStatus.initial) SearchMemberStatus status,
    BaseException? error,
  }) = _SearchMemberState;
}
