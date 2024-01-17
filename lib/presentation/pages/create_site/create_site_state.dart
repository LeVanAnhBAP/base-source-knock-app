import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/models/response/prefecture_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';

part 'create_site_state.freezed.dart';

enum CreateSiteStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CreateSiteState with _$CreateSiteState {
  const factory CreateSiteState({
    StaticDataResponse? staticData,
    @Default(<MemberResponse>[]) List<MemberResponse> members,
    @Default(<PrefectureResponse>[]) List<PrefectureResponse> prefecture,
    @Default(CreateSiteStatus.initial) CreateSiteStatus status,
    BaseException? error,
  }) = _CreateSiteState;
}
