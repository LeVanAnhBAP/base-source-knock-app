import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_event.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_state.dart';

@injectable
class MemberInvitationBloc extends Bloc<MemberInvitationEvent, MemberInvitationState> {
  MemberInvitationBloc() : super(const MemberInvitationState()) {
    on<MemberInvitationErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(MemberInvitationErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    MemberInvitationErrorOccurred event,
    Emitter<MemberInvitationState> emit,
  ) {
    emit(state.copyWith(
      status: MemberInvitationStatus.failure,
    ));
  }
}
