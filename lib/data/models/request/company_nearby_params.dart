import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_nearby_params.freezed.dart';
part 'company_nearby_params.g.dart';
@freezed
class CompanyNearbyParams with _$CompanyNearbyParams {
  const factory CompanyNearbyParams({
    @JsonKey(name: 'id') required int siteId,
    @JsonKey(name: 'distance') required int distance,
  }) = _CompanyNearbyParams;

  factory CompanyNearbyParams.fromJson(Map<String, dynamic> json) =>
      _$CompanyNearbyParamsFromJson(json);
}
