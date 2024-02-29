import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_event.dart';
import '../../../../core/exceptions/unknown_exception.dart';
import '../../../../data/services/auth/auth.services.impl.dart';
import 'profile_state.dart';


class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final authServices = AuthServicesImpl(const FlutterSecureStorage());
  AccountBloc() : super(const AccountState()) {
    on<AccountGetDataStarted>(_onGetDataStated);
    on<AccountErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(AccountEvent.errorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(AccountErrorOccurred event,
      Emitter<AccountState> emit,) {
    emit(state.copyWith(
      status: AccountStatus.failure,
    ));
  }

  FutureOr<void> _onGetDataStated(AccountGetDataStarted event,
      Emitter<AccountState> emit,) async {
    emit(state.copyWith(status: AccountStatus.loading));
    try {
      Map<String, dynamic>? data = await loadUserInfo();
      if (data != null) {
        emit(state.copyWith(
          status: AccountStatus.success,
          userInfo: data,
        ));
      } else {
        emit(state.copyWith(
          status: AccountStatus.failure,
          error: UnknownException('Failed to load data'),
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: AccountStatus.failure,
        error: BaseException.from(error),
      ));
    }
  }


  Future<Map<String, dynamic>?> loadUserInfo() async {
    final accessToken = await authServices.getAccessToken();
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    String api =
        "https://dev-knock-api.oneknockapp.com/api/v1/user/me/info";

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
