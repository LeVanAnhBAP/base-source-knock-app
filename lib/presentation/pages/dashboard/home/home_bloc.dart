import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import '../../../../data/services/auth/auth.services.impl.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final authServices = AuthServicesImpl(const FlutterSecureStorage());
  int totalPage=0;
  HomeBloc() : super(const HomeState()) {
    on<DashboardHomeGetDataStarted>(_onGetDataStated);
    on<DashboardHomeGetDataByDate>(_onGetDataByDate);
    on<HomeErrorOccurred>(_onErrorOccurred);
    on<HomeRefreshData>(_onRefreshData);
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

  FutureOr<void> _onGetDataByDate(
    DashboardHomeGetDataByDate event,
    Emitter<HomeState> emit,
  ) async {
    try {
      List<dynamic>? data = await loadSite(event.date!);
      if (data != null) {
        emit(state.copyWith(
          status: HomeStatus.success,
          listData: data,
          totalPage: totalPage
        ));
      } else {
        emit(state.copyWith(
          status: HomeStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }
  FutureOr<void> _onGetDataStated(
      DashboardHomeGetDataStarted event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      List<dynamic>? data = await loadSite(event.date!);
      if (data != null) {
        emit(state.copyWith(
          status: HomeStatus.success,
          listData: data,
          totalPage: totalPage
        ));
      } else {
        emit(state.copyWith(
          status: HomeStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }
  FutureOr<void> _onRefreshData(
      HomeRefreshData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.refreshing));
  }

  Future<List<dynamic>?> loadSite(String date) async {
    final accessToken = await authServices.getAccessToken();
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
        "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors?page=1&start_day_request=$date";

    try {
      Response response = await dio.get(api);

      if (response.statusCode == 200 ) {
        totalPage = response.data['data']['total'];
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
