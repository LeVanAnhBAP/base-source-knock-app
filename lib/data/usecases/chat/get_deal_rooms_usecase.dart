


import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/paginate_deal_room_params.dart';
import 'package:uq_system_app/data/models/response/deal_room_response.dart';
import 'package:uq_system_app/data/repositories/chat/chat.repository.dart';

@injectable
class GetDealRoomsUseCase extends UseCase< List<DealRoomResponse>, PaginateDealRoomParams>{
  final ChatRepository _repository;
  GetDealRoomsUseCase(this._repository);
  @override
  Future<List<DealRoomResponse>> call(PaginateDealRoomParams params) {
    return _repository.getDealRooms(params);
  }

}