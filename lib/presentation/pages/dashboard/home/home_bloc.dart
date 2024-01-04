import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart';
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PaginateSiteUseCase _paginateSiteUseCase;
  final GetAccountUseCase _getAccountUseCase;
  int page = 1;
  HomeBloc(this._paginateSiteUseCase, this._getAccountUseCase)
      : super(const HomeState()) {
    on<DashboardHomeGetDataStarted>(_onGetDataStated);
    on<HomeErrorOccurred>(_onErrorOccurred);
    on<HomeRefreshData>(_onRefreshData);
    on<HomePaginateSite>(_onPaginateSite);
  }

  FutureOr<void> _onPaginateSite(
      HomePaginateSite event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    var result = await _paginateSiteUseCase(
        PaginateSiteParams(page: page, startDayRequest: DateFormat("yyyy-MM-dd").format(event.startDayRequest)));
    var account = await _getAccountUseCase();
    if (account != null) {
      emit(state.copyWith(
          status: HomeStatus.success, sites: result, account: account, startDayRequest: event.startDayRequest));
    } else {
      emit(state.copyWith(
        status: HomeStatus.success,
        sites: result,
        startDayRequest: event.startDayRequest
      ));
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(HomeErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    HomeErrorOccurred event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      status: HomeStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onGetDataStated(
    DashboardHomeGetDataStarted event,
    Emitter<HomeState> emit,
  ) async {}

  FutureOr<void> _onRefreshData(
      HomeRefreshData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.refreshing));
  }
}
