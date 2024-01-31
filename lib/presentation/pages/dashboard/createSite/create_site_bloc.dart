import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import 'create_site_event.dart';
import 'create_site_state.dart';


class CreateSiteBloc extends Bloc<CreateSiteEvent, CreateSiteState> {
  CreateSiteBloc() : super(const CreateSiteState()) {
    on<CreateSiteGetDataStarted>(_onGetDataStated);
    on<CreateSiteErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateSiteEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(CreateSiteErrorOccurred event,
      Emitter<CreateSiteState> emit,) {
    emit(state.copyWith(
      status: CreateSiteStatus.failure,
    ));
  }

  FutureOr<void> _onGetDataStated(CreateSiteGetDataStarted event,
      Emitter<CreateSiteState> emit,) async {
    emit(state.copyWith(status: CreateSiteStatus.loading));
    try {
      Map<String, dynamic>? data = await loadDetailSite(event.accessToken!, event.id!);
      if (data != null) {
        emit(state.copyWith(
          status: CreateSiteStatus.success,
          site: data,
        ));
      } else {
        emit(state.copyWith(
          status: CreateSiteStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: CreateSiteStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }


  Future<Map<String, dynamic>?> loadDetailSite(String accessToken,int id) async {
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
