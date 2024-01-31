

import 'package:uq_system_app/data/models/request/paginate_deal_room_params.dart';
import 'package:uq_system_app/data/models/response/deal_room_response.dart';

abstract class ChatRepository{
  Future<List<DealRoomResponse>> getDealRooms(PaginateDealRoomParams params);
}