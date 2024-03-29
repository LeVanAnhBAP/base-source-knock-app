
import 'package:dio/dio.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';


class Login extends UseCase<String, LoginParams> {
  final Dio _dio;

  Login(this._dio);

  @override
  Future<String> call(LoginParams params) async {
    final String email = params.email;
    final String password = params.password;

    const api = 'https://dev-knock-api.oneknockapp.com/api/v1/user/auth/login';
    final data = {'email': email, 'password': password};

    try {
      final Response response = await _dio.post(api, data: data);
      if (response.statusCode == 200) {
        final body = response.data;
        final String accessToken = body['data']['access_token'].toString();
        return accessToken;
      } else {
        throw 'Login failed';
      }
    } catch (e) {
      throw 'Error during login: $e';
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}
