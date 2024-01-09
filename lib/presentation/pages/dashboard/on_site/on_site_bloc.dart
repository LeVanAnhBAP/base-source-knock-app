import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_state.dart';

@injectable
class OnSiteBloc extends Bloc<OnSiteEvent, OnSiteState> {
  final PaginateSiteUseCase _paginateSiteUseCase;

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  String name = "";
  OnSiteBloc(this._paginateSiteUseCase) : super(const OnSiteState()) {
    on<OnSiteErrorOccurred>(_onErrorOccurred);
    on<OnSiteLoad>(_onLoad);
    on<OnSiteLoadMore>(_onLoadMore);
    on<OnSiteSearch>(_onSearch);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OnSiteEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onSearch(
      OnSiteSearch event, Emitter<OnSiteState> emit) async {
    emit(state.copyWith(status: OnSiteStatus.loading));
    page = 1;
    name = event.name;
    var result =
        await _paginateSiteUseCase(PaginateSiteParams(page: page, name: name));
    emit(state.copyWith(
      status: OnSiteStatus.success,
      sites: result,
    ));
    page++;
  }

  FutureOr<void> _onLoad(OnSiteLoad event, Emitter<OnSiteState> emit) async {
    if (!event.isRefresh) emit(const OnSiteState(status: OnSiteStatus.loading));
    var result = await _paginateSiteUseCase(PaginateSiteParams(page: page));
    emit(state.copyWith(
      status: OnSiteStatus.success,
      sites: result,
    ));
    page++;
    if (event.isRefresh) refreshController.refreshCompleted();
  }

  FutureOr<void> _onLoadMore(
      OnSiteLoadMore event, Emitter<OnSiteState> emit) async {
        emit(const OnSiteState(status: OnSiteStatus.loadingMore));
    var result =
        await _paginateSiteUseCase(PaginateSiteParams(page: page, name: name));
    emit(state.copyWith(
      status: OnSiteStatus.success,
      sites: result,
    ));
    if (result.isNotEmpty) page++;
    refreshController.loadComplete();
  }

  FutureOr<void> _onErrorOccurred(
    OnSiteErrorOccurred event,
    Emitter<OnSiteState> emit,
  ) { 
    if(refreshController.isLoading) refreshController.loadComplete();
    if(refreshController.isRefresh) refreshController.refreshCompleted();
    emit(state.copyWith(
      status: OnSiteStatus.failure,
    ));
  }
}
