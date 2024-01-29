import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_event.dart';

import '../../../../core/exceptions/unknown_exception.dart';
import 'search_state.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<DashboardSearchGetDataStarted>(_onGetDataStated);
    on<DashboardSearchLoadMoreData>(_onLoadMoreData);
    on<SearchErrorOccurred>(_onErrorOccurred);
  }
int currentPage = 1;
  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SearchEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(SearchErrorOccurred event,
      Emitter<SearchState> emit,) {
    emit(state.copyWith(
      status: SearchStatus.failure,
    ));
  }
  FutureOr<void> _onLoadMoreData(
      DashboardSearchLoadMoreData event,
      Emitter<SearchState> emit,
      ) async {
    try {
      currentPage++;
      List<dynamic>? data = await loadPartner(event.accessToken!,currentPage);
      if (data != null) {
        emit(state.copyWith(
          status: SearchStatus.success,
          listPartner: (state.listPartner??[])+data,
        ));
      } else {
        emit(state.copyWith(
          status: SearchStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SearchStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }
  FutureOr<void> _onGetDataStated(DashboardSearchGetDataStarted event,
      Emitter<SearchState> emit,) async {
    emit(state.copyWith(status: SearchStatus.loading));
    try {
      List<dynamic>? data = await loadPartner(event.accessToken!,1);
      if (data != null) {
        emit(state.copyWith(
          status: SearchStatus.success,
          listPartner: data,
        ));
      } else {
        emit(state.copyWith(
          status: SearchStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SearchStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }


  Future<List< dynamic>?> loadPartner(String accessToken,int page) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
       'https://dev-knock-api.oneknockapp.com/api/v1/user/companies/search/partners?page=$page&per_page=10';

    try {
      Response response = await dio.get(api);

      if (response.statusCode == 200) {
        return response.data['data']['data'];
      } else {
        print('Failed to load data');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('An error occurred: $e');
      throw Exception('An error occurred: $e');
    }
  }
}
