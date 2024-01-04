import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart';
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_event.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_state.dart';

@injectable
class OnSiteBloc extends Bloc<OnSiteEvent, OnSiteState> {
  final PaginateSiteUseCase _paginateSiteUseCase;
  final GetAccountUseCase _getAccountUseCase;
  int page = 1;
  OnSiteBloc(this._paginateSiteUseCase, this._getAccountUseCase)
      : super(const OnSiteState()) {
    on<OnSiteErrorOccurred>(_onErrorOccurred);
    on<OnSiteLoad>(_onLoad);
    on<OnSiteLoadMore>(_onLoadMore);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(OnSiteEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onLoad(OnSiteLoad event, Emitter<OnSiteState> emit) async {
    emit(state.copyWith(status: OnSiteStatus.loading));
    var result = await _paginateSiteUseCase(PaginateSiteParams(page: page));
    var account = await _getAccountUseCase();
    if (account != null) {
      emit(state.copyWith(
        status: OnSiteStatus.success,
        sites: result,
        account: account,
      ));
    } else {
      emit(state.copyWith(
        status: OnSiteStatus.success,
        sites: result,
      ));
    }
    page++;
  }

  FutureOr<void> _onLoadMore(
      OnSiteLoadMore event, Emitter<OnSiteState> emit) async {
    emit(state.copyWith(status: OnSiteStatus.loadingMore));
    var result = await _paginateSiteUseCase(PaginateSiteParams(page: page));
    emit(state.copyWith(
      status: OnSiteStatus.success,
      sites: result,
    ));
    page++;
  }

  FutureOr<void> _onErrorOccurred(
    OnSiteErrorOccurred event,
    Emitter<OnSiteState> emit,
  ) {
    emit(state.copyWith(
      status: OnSiteStatus.failure,
    ));
  }
}
