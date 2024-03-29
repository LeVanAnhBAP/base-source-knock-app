
import 'package:freezed_annotation/freezed_annotation.dart';
part 'price_order_detail_model.freezed.dart';
part 'price_order_detail_model.g.dart';
@freezed
class PriceOrderDetailModel with _$PriceOrderDetailModel{
  const factory PriceOrderDetailModel({
    @JsonKey(name: 'id')  int? id,
    @JsonKey(name: 'name')  String? name,
    @JsonKey(name: 'quantity')  int? quantity,
    @JsonKey(name: 'unit')  int? unit,
    @JsonKey(name: 'price_unit')  int? priceUnit,
    @JsonKey(name: 'specifications')  String? specifications,
}) = _PriceOrderDetailModel;
  factory PriceOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PriceOrderDetailModelFromJson(json);
}