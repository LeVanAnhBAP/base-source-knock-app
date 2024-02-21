import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_bloc.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_state.dart';

class MemberInvitationSelector<T>
    extends BlocSelector<MemberInvitationBloc, MemberInvitationState, T> {
  MemberInvitationSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class MemberInvitationStatusListener extends BlocListener<MemberInvitationBloc, MemberInvitationState> {
  MemberInvitationStatusListener({
    required Iterable<MemberInvitationStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
