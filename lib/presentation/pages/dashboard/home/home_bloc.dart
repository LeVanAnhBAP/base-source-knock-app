import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/models/response/unread_count_response.dart';
import 'package:uq_system_app/data/usecases/nofity/get_notify_usecase.dart';
import 'package:uq_system_app/data/usecases/nofity/get_unread_count_usecase.dart';
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PaginateSiteUseCase _paginateSiteUseCase;
  final GetUnreadCountUseCase _getUnreadCountUseCase;
  final GetNotifyUseCase _getNotifyUseCase;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  String _startDayRequest = "";

  HomeBloc(this._paginateSiteUseCase, this._getUnreadCountUseCase,
      this._getNotifyUseCase)
      : super(const HomeState()) {
    on<DashboardHomeGetDataStarted>(_onGetDataStated);
    on<HomeErrorOccurred>(_onErrorOccurred);
    on<HomeRefreshData>(_onRefreshData);
    on<HomePaginateSite>(_onPaginateSite);
  }

  FutureOr<void> _onPaginateSite(
      HomePaginateSite event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loadingSites));
    _startDayRequest = DateFormat("yyyy-MM-dd").format(event.startDayRequest);
    var result = await _paginateSiteUseCase(
        PaginateSiteParams(page: page, startDayRequest: _startDayRequest));
    emit(state.copyWith(
        status: HomeStatus.success,
        sites: result,
        startDayRequest: event.startDayRequest));
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
    if (refreshController.isLoading) refreshController.loadComplete();
    if (refreshController.isRefresh) refreshController.refreshCompleted();
    emit(state.copyWith(
      status: HomeStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onGetDataStated(
    DashboardHomeGetDataStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    _startDayRequest = DateFormat("yyyy-MM-dd").format(DateTime.now());
    await Future.wait([
      _paginateSiteUseCase(
          PaginateSiteParams(page: page, startDayRequest: _startDayRequest)),
      _getUnreadCountUseCase(),
      _getNotifyUseCase(),
    ]).then((value){
      emit(state.copyWith(
          status: HomeStatus.success,
          sites: value[0] as List<SiteResponse>,
          unreadNotifyCount: (value[1] as UnreadCount).count,
          startDayRequest: DateTime.now()));
    });
  }

  FutureOr<void> _onRefreshData(
      HomeRefreshData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.refreshing));
    var result = await _paginateSiteUseCase(
        PaginateSiteParams(page: page, startDayRequest: _startDayRequest));
    refreshController.refreshCompleted();
    emit(state.copyWith(status: HomeStatus.success, sites: result));
  }
}
