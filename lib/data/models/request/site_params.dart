import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/request/factory_floor_address_params.dart';
import 'package:uq_system_app/data/models/request/price_order_details_params.dart';

part 'site_params.freezed.dart';

part 'site_params.g.dart';

@freezed
class SiteParams with _$SiteParams {
  const factory SiteParams(
    int? id,
    @JsonKey(name: 'members') List<int>? members,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'content_request') String? contentRequest,
    @JsonKey(name: 'occupations') List<int>? occupations,
    @JsonKey(name: 'start_day_request') String? startDayRequest,
    @JsonKey(name: 'end_day_request') String? endDayRequest,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'is_draft') bool? isDraft,
    @JsonKey(name: 'factory_floor_address')
    FactoryFloorAddressParams? factoryFloorAddress,
    @JsonKey(name: 'delivery_destination') String? deliveryDes,
    @JsonKey(name: 'price_order_details')
    PriceOrderDetailsParams? priceOrderDetails,
    @JsonKey(name: 'total_amount') int? totalAmount,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'expenses') int? expenses,
  ) = _SiteParams;

  factory SiteParams.fromJson(Map<String, Object?> json) =>
      _$SiteParamsFromJson(json);
}
