


import 'package:freezed_annotation/freezed_annotation.dart';
part 'tax_rate_response.freezed.dart';
part 'tax_rate_response.g.dart';
@freezed
class TaxRateResponse with _$TaxRateResponse{
  const factory TaxRateResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'percentage') required String percentage,
    @JsonKey(name: 'created_at') String? createAt,
    @JsonKey(name: 'updated_at') String? updateAt,
}) = _TaxRateResponse;
  factory TaxRateResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxRateResponseFromJson(json);
}