

import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_details_response.freezed.dart';
part 'site_details_response.g.dart';

@freezed
class SiteDetailsResponse with _$SiteDetailsResponse {
  const factory SiteDetailsResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'name')  String? name,
    @JsonKey(name: 'start_day_request') required String startDayRequest,
    @JsonKey(name: 'end_day_request') required String endDayRequest,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'latitude')  String? latitude,
    @JsonKey(name: 'longitude')  String? longitude,
  }) = _SiteDetailsResponse;
  factory SiteDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteDetailsResponseFromJson(json);
}
