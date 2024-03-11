import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

import '../../../domain/entities/member.dart';

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
    @Default(<Member>[]) List<Member> searchedMembers,
    @Default(<Member>[]) List<Member> members,
    @Default(SearchMemberStatus.initial) SearchMemberStatus status,
    BaseException? error,
  }) = _SearchMemberState;
}
