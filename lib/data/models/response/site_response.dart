import 'package:freezed_annotation/freezed_annotation.dart';
part 'site_response.freezed.dart';
part 'site_response.g.dart';

@freezed
class SiteResponse with _$SiteResponse {
  const factory SiteResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'name')  String? name,
    @JsonKey(name: 'start_day_request') required String startDayRequest,
    @JsonKey(name: 'end_day_request') required String endDayRequest,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'company_name_kana') required String companyNameKana,
    @JsonKey(name: 'company_logo') required String companyLogo,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'latitude')  String? latitude,
    @JsonKey(name: 'longitude')  String? longitude,
  }) = _SiteResponse;
  factory SiteResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteResponseFromJson(json);
}
