
import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginate_partner_params.freezed.dart';
@freezed
class PaginatePartnerParams with _$PaginatePartnerParams{
  const factory PaginatePartnerParams({
    required int page,
    required int perPage
  }) = _PaginatePartnerParams;
}