import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import '../../../../data/services/auth/auth.services.dart';
import '../../../../data/services/auth/auth.services.impl.dart';
import 'site_event.dart';
import 'site_state.dart';

class SiteBloc extends Bloc<SiteEvent, SiteState> {
  final authServices = AuthServicesImpl(const FlutterSecureStorage());
  int currentPage =1;
  String currentSearchText ='';
  SiteBloc() : super(const SiteState()) {
    on<DashboardSiteGetDataStarted>(_onGetDataStated);
    on<DashboardSiteLoadSearchData>(_onLoadSearchData);
    on<DashboardSiteLoadMoreData>(_onLoadMoreData);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SiteErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
      SiteErrorOccurred event,
      Emitter<SiteState> emit,
      ) {
    emit(state.copyWith(
      status: SiteStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onLoadSearchData(
      DashboardSiteLoadSearchData event,
      Emitter<SiteState> emit,
      ) async {
    try {
      currentPage=1;
      currentSearchText =event.searchText!;
      List<dynamic>? data = await searchSite(event.searchText!,1);
      if (data != null) {
        emit(state.copyWith(
          status: SiteStatus.success,
          listSite: data,
        ));
      } else {
        emit(state.copyWith(
          status: SiteStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SiteStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }
  FutureOr<void> _onGetDataStated(
      DashboardSiteGetDataStarted event,
      Emitter<SiteState> emit,
      ) async {
    emit(state.copyWith(status: SiteStatus.loading));
    try {
      List<dynamic>? data = await searchSite('',1);
      if (data != null) {
        emit(state.copyWith(
          status: SiteStatus.success,
          listSite: data,
        ));
      } else {
        emit(state.copyWith(
          status: SiteStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SiteStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }
  FutureOr<void> _onLoadMoreData(
      DashboardSiteLoadMoreData event,
      Emitter<SiteState> emit,
      ) async {
    try {
      currentPage++;
      List<dynamic>? data = await searchSite(currentSearchText,currentPage);
      if (data != null) {
        emit(state.copyWith(
          status: SiteStatus.success,
          listSite: (state.listSite??[])+data,
        ));
      } else {
        emit(state.copyWith(
          status: SiteStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SiteStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }

  Future<List<dynamic>> searchSite( String searchText, int page) async {
    final accessToken = await authServices.getAccessToken();
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
        "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors?page=$page&name=$searchText";
    try {
      Response response = await dio.get(api);

      if (response.statusCode == 200) {
        return response.data['data']['data'];
      } else {
        print('Failed to load data');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }
}
