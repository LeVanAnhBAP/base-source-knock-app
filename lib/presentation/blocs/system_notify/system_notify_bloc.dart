import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/usecases/nofity/get_notify_usecase.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_event.dart';
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_state.dart';


@lazySingleton
class SystemNotifyBloc extends Bloc<SystemNotifyEvent, SystemNotifyState> {
  final GetNotifyUseCase _getNotifyUseCase;
  SystemNotifyBloc(this._getNotifyUseCase) : super(const SystemNotifyState()) {
    on<SystemNotifyErrorOccurred>(_onErrorOccurred);
    on<SystemNotifyLoadUnread>(_onLoadUnread);
  }
  FutureOr<void> _onLoadUnread(
      SystemNotifyLoadUnread event,
      Emitter<SystemNotifyState> emit,
      ) async{
    var result = await _getNotifyUseCase();
    emit(state.copyWith(
      status: SystemNotifyStatus.success,
      unreadResponse: result
    ));
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SystemNotifyErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    SystemNotifyErrorOccurred event,
    Emitter<SystemNotifyState> emit,
  ) {
    emit(state.copyWith(
      status: SystemNotifyStatus.failure,
    ));
  }
}
