import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_state.dart';

class NotificationSelector<T>
    extends BlocSelector<NotificationBloc, NotificationState, T> {
  NotificationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}
class NotificationStatusListener extends BlocListener<NotificationBloc, NotificationState> {
  NotificationStatusListener({
    required Iterable<NotificationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}