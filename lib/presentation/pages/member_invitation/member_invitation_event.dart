import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'member_invitation_event.freezed.dart';

@freezed
class MemberInvitationEvent with _$MemberInvitationEvent {
  const factory MemberInvitationEvent.errorOccurred([BaseException? error]) = MemberInvitationErrorOccurred;
}
