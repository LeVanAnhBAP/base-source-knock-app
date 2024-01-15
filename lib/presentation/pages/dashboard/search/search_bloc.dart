import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uq_system_app/data/models/request/favorite_partner_params.dart';
import 'package:uq_system_app/data/models/request/paginate_partner_params.dart';
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart';
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_state.dart';

import '../../../../core/exceptions/exception.dart';

@lazySingleton
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PaginatePartnerUseCase _paginatePartnerUseCase;
  final ChangeFavoritePartnerStateUseCase _changeFavoritePartnerStateUseCase;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  int page = 1;

  SearchBloc(
      this._paginatePartnerUseCase, this._changeFavoritePartnerStateUseCase)
      : super(const SearchState()) {
    on<SearchErrorOccurred>(_onErrorOccurred);
    on<SearchLoad>(_onLoad);
    on<SearchLoadMore>(_onLoadMore);
    on<SearchChangeFavoritePartnerState>(_onChangeFavoritePartnerState);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SearchErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onChangeFavoritePartnerState(
      SearchChangeFavoritePartnerState event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    var index = state.partners.indexWhere((element) => element.id == event.id);
    var partner = state.partners[index];
    await _changeFavoritePartnerStateUseCase( FavoritePartnerParams(
        companyId: partner.id.toString(), isFavorite: partner.isFavorite? "DISABLED" : "ENABLED"));
    partner = partner.copyWith( isFavorite: !partner.isFavorite);
    emit(state.copyWith(
        status: SearchStatus.success,
        partners: List.from(state.partners)..[index] = partner));
  }

  FutureOr<void> _onLoad(SearchLoad event, Emitter<SearchState> emit) async {
    page = 1;
    emit(state.copyWith(status: SearchStatus.loading));
    var result = await _paginatePartnerUseCase(
        PaginatePartnerParams(page: page, perPage: 10));
    refreshController.refreshCompleted();
    emit(state.copyWith(status: SearchStatus.success, partners: result));
    page++;
  }

  FutureOr<void> _onLoadMore(
      SearchLoadMore event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loadingMore));
    var result = await _paginatePartnerUseCase(
        PaginatePartnerParams(page: page, perPage: 10));
    refreshController.loadComplete();
    emit(state.copyWith(
        status: SearchStatus.success,
        partners: List.from(state.partners)..addAll(result)));
    if (result.isNotEmpty) page++;
  }

  FutureOr<void> _onErrorOccurred(
    SearchErrorOccurred event,
    Emitter<SearchState> emit,
  ) {
    if (refreshController.isLoading) refreshController.loadComplete();
    if (refreshController.isRefresh) refreshController.refreshCompleted();
    emit(state.copyWith(
      status: SearchStatus.failure,
    ));
  }
}
