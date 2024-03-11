import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/usecases/nofity/get_notifications_usecase.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_event.dart';
import 'package:uq_system_app/presentation/pages/notification/notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationBloc(this._getNotificationsUseCase) : super(const NotificationState()) {
    on<NotificationErrorOccurred>(_onErrorOccurred);
    on<NotificationLoad>(_onLoad);
  }
  FutureOr<void> _onLoad(
      NotificationLoad event,
      Emitter<NotificationState> emit,
      ) async{
    emit(state.copyWith(status: NotificationStatus.loading));
    EasyLoading.show();
    var result = await _getNotificationsUseCase(state.page);
    EasyLoading.dismiss();
    emit(state.copyWith(
      status: NotificationStatus.success,
      notifications: result
    ));
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    if(EasyLoading.isShow) EasyLoading.dismiss();
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    NotificationErrorOccurred event,
    Emitter<NotificationState> emit,
  ) {
    emit(state.copyWith(
      status: NotificationStatus.failure,
    ));
  }
}
