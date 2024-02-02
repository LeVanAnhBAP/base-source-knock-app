import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/dashboard/siteDetails/site_details_event.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import '../../../../data/services/auth/auth.services.impl.dart';
import 'site_details_state.dart';

class SiteDetailsBloc extends Bloc<SiteDetailsEvent, SiteDetailsState> {
  final authServices = AuthServicesImpl(const FlutterSecureStorage());
  SiteDetailsBloc() : super( SiteDetailsState()) {
    on<SiteDetailsGetDataStarted>(_onGetDataStated);
    on<SiteDetailsErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SiteDetailsErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
      SiteDetailsErrorOccurred event,
      Emitter<SiteDetailsState> emit,
      ) {
    emit(state.copyWith(
      status: SiteDetailsStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onGetDataStated(
      SiteDetailsGetDataStarted event,
      Emitter<SiteDetailsState> emit,
      ) async {
    emit(state.copyWith(status: SiteDetailsStatus.loading));
    try {
      Map<String,dynamic>? data = await loadDetailSite(event.id!);
      if (data != null) {
        emit(state.copyWith(
          status: SiteDetailsStatus.success,
          siteDetail: data,
        ));
      } else {
        emit(state.copyWith(
          status: SiteDetailsStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: SiteDetailsStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }



  Future<Map<String, dynamic>?> loadDetailSite(String id) async {
    final accessToken = await authServices.getAccessToken();
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
        "https://dev-knock-api.oneknockapp.com/api/v1/user/factory-floors/$id";

    try {
      Response response = await dio.get(api);

      if (response.statusCode == 200) {
        return response.data['data'];
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
