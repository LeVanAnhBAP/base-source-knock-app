import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_bloc.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_state.dart';

class DealRoomSelector<T>
    extends BlocSelector<DealRoomBloc, DealRoomState, T> {
  DealRoomSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class DealRoomStatusListener extends BlocListener<DealRoomBloc, DealRoomState> {
  DealRoomStatusListener({
    required Iterable<DealRoomStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
