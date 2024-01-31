import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/deal_room_response.dart';

part 'deal_room_state.freezed.dart';

enum DealRoomStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class DealRoomState with _$DealRoomState {
  const factory DealRoomState({
    @Default([]) List<DealRoomResponse> dealRooms,
    @Default(1) int page,
    @Default("") String searchCompanyName,
    @Default(DealRoomStatus.initial) DealRoomStatus status,
    BaseException? error,
  }) = _DealRoomState;
}
