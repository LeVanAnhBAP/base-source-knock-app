import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'onsite_information_room_event.freezed.dart';

@freezed
class OnsiteInformationRoomEvent with _$OnsiteInformationRoomEvent {
  const factory OnsiteInformationRoomEvent.errorOccurred([BaseException? error]) = OnsiteInformationRoomErrorOccurred;
}
