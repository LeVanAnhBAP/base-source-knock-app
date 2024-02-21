import 'package:uq_system_app/data/models/request/login_params.dart';

abstract class AuthServices {
  const AuthServices();

  Future<Map<String, dynamic>?> getAuthenticatedHeaders(
      Map<String, dynamic> headers);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();
  Future<void> saveTokenExpiresTime(String? expiresAt) ;
  Future<String?> getTokenExpiresTime();
  Future<void> saveAccessToken(String? token);
  Future<void> saveLoginInfo(LoginParams loginInfo);
  Future<void> saveRememberLoginInfoFlag(String flag);
  Future<String?> getRememberLoginInfoFlag();
  Future<LoginParams?> getLoginInfo();
  Future<void> saveRefreshToken(String? token);

  Future<void> removeAllTokens();

  Future<void> logout();
}
