import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'onsite_information_room_state.freezed.dart';

enum OnsiteInformationRoomStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class OnsiteInformationRoomState with _$OnsiteInformationRoomState {
  const factory OnsiteInformationRoomState({
    @Default(OnsiteInformationRoomStatus.initial) OnsiteInformationRoomStatus status,
    BaseException? error,
  }) = _OnsiteInformationRoomState;
}
