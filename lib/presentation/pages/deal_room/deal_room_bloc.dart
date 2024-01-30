import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/usecases/chat/get_deal_rooms_usecase.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_event.dart';
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_state.dart';

@injectable
class DealRoomBloc extends Bloc<DealRoomEvent, DealRoomState> {
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);
  final GetDealRoomsUseCase _getDealRoomsUseCase;
  DealRoomBloc(this._getDealRoomsUseCase) : super(const DealRoomState()) {
    on<DealRoomErrorOccurred>(_onErrorOccurred);
    on<DealRoomLoad>(_onLoad);
  }
  FutureOr<void> _onLoad(
      DealRoomLoad event,
      Emitter<DealRoomState> emit,
      ) async{
    emit(state.copyWith(
      status: DealRoomStatus.loading,
    ));
    EasyLoading.show();
    var result = await _getDealRoomsUseCase(state.page);
    EasyLoading.dismiss();
    emit(state.copyWith(status: DealRoomStatus.success, dealRooms: result));
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    if(EasyLoading.isShow)  EasyLoading.dismiss();
    add(DealRoomErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    DealRoomErrorOccurred event,
    Emitter<DealRoomState> emit,
  ) {
    emit(state.copyWith(
      status: DealRoomStatus.failure,
    ));
  }
}
