import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'deal_room_event.freezed.dart';

@freezed
class DealRoomEvent with _$DealRoomEvent {
  const factory DealRoomEvent.errorOccurred([BaseException? error]) = DealRoomErrorOccurred;
  const factory DealRoomEvent.load() = DealRoomLoad;
  const factory DealRoomEvent.loadMore() = DealRoomLoadMore;
  const factory DealRoomEvent.search({required String name}) = DealRoomSearch;
}
