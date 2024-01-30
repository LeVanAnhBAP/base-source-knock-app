

import 'package:uq_system_app/data/models/response/deal_room_response.dart';

abstract class ChatRepository{
  Future<List<DealRoomResponse>> getDealRooms(int page);
}