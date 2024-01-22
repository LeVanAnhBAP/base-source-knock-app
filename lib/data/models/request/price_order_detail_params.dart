
import 'package:freezed_annotation/freezed_annotation.dart';
part 'price_order_detail_params.freezed.dart';
part 'price_order_detail_params.g.dart';
@freezed
class PriceOrderDetailParams with _$PriceOrderDetailParams{
  const factory PriceOrderDetailParams({
    @JsonKey(name: 'name')  String? name,
    @JsonKey(name: 'quantity')  int? quantity,
    @JsonKey(name: 'unit')  int? unit,
    @JsonKey(name: 'price_unit')  int? priceUnit,
    @JsonKey(name: 'specifications')  String? specifications,
}) = _PriceOrderDetailParams;
  factory PriceOrderDetailParams.fromJson(Map<String, dynamic> json) =>
      _$PriceOrderDetailParamsFromJson(json);
}