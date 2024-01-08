import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/paginate_partner_params.dart';
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PaginatePartnerUseCase _paginatePartnerUseCase;
  int page = 1;
  SearchBloc(this._paginatePartnerUseCase) : super(const SearchState()) {
    on<SearchErrorOccurred>(_onErrorOccurred);
    on<SearchLoad>(_onLoad);
    on<SearchLoadMore>(_onLoadMore);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onLoad(SearchLoad event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    var result = await _paginatePartnerUseCase(
        PaginatePartnerParams(page: page, perPage: 10));
    emit(state.copyWith(status: SearchStatus.success, partners: result));
    page++;
  }

  FutureOr<void> _onLoadMore(
      SearchLoadMore event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loadingMore));
    var result = await _paginatePartnerUseCase(
        PaginatePartnerParams(page: page, perPage: 10));
    emit(state.copyWith(status: SearchStatus.success, partners: result));
    if(result.isNotEmpty) page++;
  }

  FutureOr<void> _onErrorOccurred(
    SearchErrorOccurred event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      status: SearchStatus.failure,
    ));
  }
}
