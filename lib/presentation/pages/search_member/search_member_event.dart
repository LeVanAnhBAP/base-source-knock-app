import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'search_member_event.freezed.dart';

@freezed
class SearchMemberEvent with _$SearchMemberEvent {
  const factory SearchMemberEvent.errorOccurred([BaseException? error]) = SearchMemberErrorOccurred;
}
