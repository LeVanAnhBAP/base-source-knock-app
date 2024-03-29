
import 'package:freezed_annotation/freezed_annotation.dart';
part 'paginate_deal_room_params.freezed.dart';
@freezed
class PaginateDealRoomParams with _$PaginateDealRoomParams{
  const factory PaginateDealRoomParams({
    @Default(1) int page,
    @Default("") String companyName
}) = _PaginateDealRoomParams;
}