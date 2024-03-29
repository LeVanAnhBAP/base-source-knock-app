import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/data/models/response/address_info_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';
import 'package:uq_system_app/domain/entities/member.dart';

part 'create_site_state.freezed.dart';

enum CreateSiteStatus {
  initial,
  loading,
  success,
  updateSuccess,
  submitSuccess,
  failure,
}

@freezed
class CreateSiteState with _$CreateSiteState {
  const factory CreateSiteState({
    @Default(false) bool isEdited,
    @Default(SiteParams()) SiteParams siteParams,
    OccupationResponse? occupation,
    StaticDataResponse? staticData,
    @Default(<Member>[]) List<Member> members,
    TaxRateResponse? taxRate,
    @Default(<AddressInfoResponse>[]) List<AddressInfoResponse> prefecture,
    @Default(<AddressInfoResponse>[]) List<AddressInfoResponse> cities,
    @Default(<AddressInfoResponse>[]) List<AddressInfoResponse> towns,
    @Default(CreateSiteStatus.initial) CreateSiteStatus status,
    BaseException? error,
  }) = _CreateSiteState;
}
