import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/data/models/response/unread_response.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_bloc.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_state.dart';


class SystemNotifyStatusSelector
    extends BlocSelector<SystemNotifyBloc, SystemNotifyState, SystemNotifyStatus> {
  SystemNotifyStatusSelector({
    required Widget Function(SystemNotifyStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}
class SystemNotifySelector<T>
    extends BlocSelector<SystemNotifyBloc, SystemNotifyState, T> {
  SystemNotifySelector({
    required Widget Function(T? data) builder,
    required super.selector
  }) : super(
    builder: (_, data) => builder(data),
  );
}
class SystemNotifyStatusListener extends BlocListener<SystemNotifyBloc, SystemNotifyState> {
  SystemNotifyStatusListener({
    required Iterable<SystemNotifyStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
