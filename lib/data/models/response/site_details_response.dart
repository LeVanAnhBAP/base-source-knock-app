import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';

part 'site_details_response.freezed.dart';

part 'site_details_response.g.dart';

@freezed
class SiteDetailsResponse with _$SiteDetailsResponse {
  const factory SiteDetailsResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'start_day_request') required String startDayRequest,
    @JsonKey(name: 'end_day_request') required String endDayRequest,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'content_request') String? contentRequest,
    @JsonKey(name: 'company_id') int? companyId,
    @JsonKey(name: 'prefecture_id') int? prefectureId,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'town_id') int? townId,
    @JsonKey(name: 'wards') String? wards,
    @JsonKey(name: 'building_number') String? buildingNumber,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'total_amount')  int? totalAmount,
    @JsonKey(name: 'order_number')  int? orderNumber,
    @JsonKey(name: 'expenses')  int? expenses,
    @JsonKey(name: 'tax_amount')  int? taxAmount,
    @JsonKey(name: 'prefecture_city_name') String? prefectureCityName,
    @JsonKey(name: 'factory_floor_members')
    @Default([])
     List<MemberResponse> members,
    @JsonKey(name: 'factory_floor_occupation')
    @Default([]) List<OccupationResponse> occupations,
    @JsonKey(name: 'price_order_details')
    @Default([]) List<PriceOrderDetailModel> priceOrderDetails,
    @JsonKey(name: 'image_type_1')  @Default([]) List<ImageResponse> imageType1,
    @JsonKey(name: 'image_type_2')  @Default([]) List<ImageResponse> imageType2,
  }) = _SiteDetailsResponse;

  factory SiteDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SiteDetailsResponseFromJson(json);
}
