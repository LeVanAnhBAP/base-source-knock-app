import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/onsite_information_room/onsite_information_room_bloc.dart';
import 'package:uq_system_app/presentation/pages/onsite_information_room/onsite_information_room_state.dart';

class OnsiteInformationRoomSelector<T>
    extends BlocSelector<OnsiteInformationRoomBloc, OnsiteInformationRoomState, T> {
  OnsiteInformationRoomSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class OnsiteInformationRoomStatusListener extends BlocListener<OnsiteInformationRoomBloc, OnsiteInformationRoomState> {
  OnsiteInformationRoomStatusListener({
    required Iterable<OnsiteInformationRoomStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
