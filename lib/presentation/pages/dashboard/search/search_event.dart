import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.errorOccurred([BaseException? error]) =
      SearchErrorOccurred;
  const factory SearchEvent.load() = SearchLoad;
  const factory SearchEvent.searchPartners() = SearchLoadMore;
  const factory SearchEvent.changeFavoritePartnerState({required int id}) = SearchChangeFavoritePartnerState;
}
