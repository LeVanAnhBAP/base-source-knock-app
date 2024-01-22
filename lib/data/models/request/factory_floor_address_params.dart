
import 'package:freezed_annotation/freezed_annotation.dart';
part 'factory_floor_address_params.freezed.dart';
part 'factory_floor_address_params.g.dart';
@freezed
class FactoryFloorAddressParams with _$FactoryFloorAddressParams{
  const factory FactoryFloorAddressParams({
    @JsonKey(name: 'prefecture_id') required int id,
    @JsonKey(name: 'city_id') required int cityId,
    @JsonKey(name: 'town_id') required int townId,
    @JsonKey(name: 'wards') required String wards,
    @JsonKey(name: 'building_number') required String buildingNumber,
}) = _FactoryFloorAddressParams;
  factory FactoryFloorAddressParams.fromJson(Map<String, dynamic> json) =>
      _$FactoryFloorAddressParamsFromJson(json);
}