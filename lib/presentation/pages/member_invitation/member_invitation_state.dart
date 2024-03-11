import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'member_invitation_state.freezed.dart';

enum MemberInvitationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class MemberInvitationState with _$MemberInvitationState {
  const factory MemberInvitationState({
    @Default(MemberInvitationStatus.initial) MemberInvitationStatus status,
    BaseException? error,
  }) = _MemberInvitationState;
}
