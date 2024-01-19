import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/models/response/prefecture_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/domain/entities/member.dart';

part 'create_site_state.freezed.dart';

enum CreateSiteStatus {
  initial,
  loading,
  success,
  searching,
  searchSuccess,
  failure,
}

@freezed
class CreateSiteState with _$CreateSiteState {
  const factory CreateSiteState({
    StaticDataResponse? staticData,
    @Default(<Member>[]) List<Member> members,
    @Default(<PrefectureResponse>[]) List<PrefectureResponse> prefecture,
    @Default(CreateSiteStatus.initial) CreateSiteStatus status,
    BaseException? error,
  }) = _CreateSiteState;
}
