import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';

part 'site_order_response.freezed.dart';
part 'site_order_response.g.dart';

@freezed
class SiteOrderResponse with _$SiteOrderResponse {
  const factory SiteOrderResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'factory_floor_id') int? siteId,
    @JsonKey(name: 'work_company_id') int? workCompanyId,
    @JsonKey(name: 'answers_time_expired') String? ansTimeExpired,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'actual_amount') int? actualAmount,
    @JsonKey(name: 'work_company') required CompanyResponse workCompany,
  }) = _SiteOrderResponse;

  factory SiteOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteOrderResponseFromJson(json);
}
