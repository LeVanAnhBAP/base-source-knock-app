
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_partner_params.freezed.dart';
part 'favorite_partner_params.g.dart';

@freezed
class FavoritePartnerParams with _$FavoritePartnerParams{
  const factory FavoritePartnerParams({
    @JsonKey(name: 'company_id')
    required String companyId,
    @JsonKey(name: 'is_favorite')
    required String isFavorite,
}) = _FavoritePartnerParams;
factory FavoritePartnerParams.fromJson(Map<String, dynamic> json) =>
_$FavoritePartnerParamsFromJson(json);
}