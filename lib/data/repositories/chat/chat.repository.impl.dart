

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/deal_room_response.dart';
import 'package:uq_system_app/data/repositories/chat/chat.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as : ChatRepository)
class ChatRepositoryImpl implements ChatRepository{
  final NetworkDataSource _networkDataSource;
  ChatRepositoryImpl(this._networkDataSource);
  @override
  Future<List<DealRoomResponse>> getDealRooms(int page) async{
    var result = await _networkDataSource.getDealRooms(page);
    return result.data!.data;
  }

}