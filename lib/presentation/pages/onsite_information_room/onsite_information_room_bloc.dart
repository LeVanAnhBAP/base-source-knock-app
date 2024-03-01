import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/onsite_information_room/onsite_information_room_event.dart';
import 'package:uq_system_app/presentation/pages/onsite_information_room/onsite_information_room_state.dart';

@injectable
class OnsiteInformationRoomBloc extends Bloc<OnsiteInformationRoomEvent, OnsiteInformationRoomState> {
  OnsiteInformationRoomBloc() : super(const OnsiteInformationRoomState()) {
    on<OnsiteInformationRoomErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OnsiteInformationRoomErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    OnsiteInformationRoomErrorOccurred event,
    Emitter<OnsiteInformationRoomState> emit,
  ) {
    emit(state.copyWith(
      status: OnsiteInformationRoomStatus.failure,
    ));
  }
}
