
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import '../../../../data/services/auth/auth.services.impl.dart';
import 'detail_partner_event.dart';
import 'detail_partner_state.dart';


class DetailPartnerBloc extends Bloc<DetailPartnerEvent, DetailPartnerState> {
  final authServices = AuthServicesImpl(const FlutterSecureStorage());
  DetailPartnerBloc() : super(const DetailPartnerState()) {
    on<DetailPartnerGetDataStarted>(_onGetDataStated);
    on<DetailPartnerErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(DetailPartnerEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(DetailPartnerErrorOccurred event,
      Emitter<DetailPartnerState> emit,) {
    emit(state.copyWith(
      status: DetailPartnerStatus.failure,
    ));
  }

  FutureOr<void> _onGetDataStated(DetailPartnerGetDataStarted event,
      Emitter<DetailPartnerState> emit,) async {
    emit(state.copyWith(status: DetailPartnerStatus.loading));
    try {
      Map<String, dynamic>? data = await loadUserInfo();
      if (data != null) {
        emit(state.copyWith(
          status: DetailPartnerStatus.success,
          userInfo: data,
        ));
      } else {
        emit(state.copyWith(
          status: DetailPartnerStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: DetailPartnerStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }


  Future<Map<String, dynamic>?> loadUserInfo() async {
    final accessToken = await authServices.getAccessToken();
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
        "";

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
