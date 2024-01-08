
import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginate_site_params.freezed.dart';
@freezed
class PaginateSiteParams with _$PaginateSiteParams{
  const factory PaginateSiteParams({
    required int page,
     String? startDayRequest,
     String? name,
  }) = _PaginateSiteParams;
}