import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';

import '../../../domain/entities/member.dart';

part 'create_site_event.freezed.dart';

@freezed
class CreateSiteEvent with _$CreateSiteEvent {
  const factory CreateSiteEvent.errorOccurred([BaseException? error]) = CreateSiteErrorOccurred;
  const factory CreateSiteEvent.loadInfo({required int userId}) = CreateSiteLoadInfo;
  const factory CreateSiteEvent.updateMembers({required List<Member> newMembers}) = CreateSiteUpdateMembers;
  const factory CreateSiteEvent.removeMember({required int id}) = CreateSiteRemoveMemeber;
}
