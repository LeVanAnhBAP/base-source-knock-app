import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/domain/entities/member.dart';

part 'search_member_event.freezed.dart';

@freezed
class SearchMemberEvent with _$SearchMemberEvent {
  const factory SearchMemberEvent.errorOccurred(
      [BaseException? error]) = SearchMemberErrorOccurred;
  const factory SearchMemberEvent.receiveData({required List<Member> members  }) = SearchMemberReceiveData;
  const factory SearchMemberEvent.search(
      {required String searchText}) = SearchMemberSearch;

  const factory SearchMemberEvent.changeSelection({required int memberId}) = SearchMemberChangeSelection;
}
