import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/data/models/response/room_chat_deal_response.dart';
import 'package:uq_system_app/data/models/response/schedule.dart';
import 'package:uq_system_app/data/models/response/work_area_reponse.dart';

part 'partner_response.freezed.dart';

part 'partner_response.g.dart';

@freezed
class PartnerResponse with _$PartnerResponse {
  const factory PartnerResponse(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'man_number') @Default(0) int manNumber,
      @JsonKey(name: 'logo') ImageResponse? logo,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'intro') String? intro,
      @JsonKey(name: 'constract_type') int? contactType,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'is_favorite') required bool isFavorite,
      @JsonKey(name: 'work_areas') required List<WorkAreaResponse> workAreas,
      @JsonKey(name: 'occupation_sub_item')
      required List<OccupationResponse> occSubItem,
      @JsonKey(name: 'schedules') required List<Schedule> schedules,
      @JsonKey(name: 'room_chat_deal')
      RoomChatDealResponse? roomChatDeal}) = _PartnerResposne;

  factory PartnerResponse.fromJson(Map<String, dynamic> json) =>
      _$PartnerResponseFromJson(json);
}