
import 'package:freezed_annotation/freezed_annotation.dart';
part 'price_order_details_params.freezed.dart';
part 'price_order_details_params.g.dart';
@freezed
class PriceOrderDetailsParams with _$PriceOrderDetailsParams{
  const factory PriceOrderDetailsParams({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'unit') required int unit,
    @JsonKey(name: 'price_unit') required int priceId,
    @JsonKey(name: 'specifications') required String specifications,
}) = _PriceOrderDetailsParams;
  factory PriceOrderDetailsParams.fromJson(Map<String, dynamic> json) =>
      _$PriceOrderDetailsParamsFromJson(json);
}