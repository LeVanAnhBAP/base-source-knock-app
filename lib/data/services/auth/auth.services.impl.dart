import 'dart:convert';
import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/services/auth/auth.services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@LazySingleton(as: AuthServices)
class AuthServicesImpl extends AuthServices {
  static const String _prefix = '@@oauth-token';

  final String key;
  final FlutterSecureStorage _storage;

  const AuthServicesImpl._(
    this._storage,
    this.key,
  );

  const AuthServicesImpl(
      FlutterSecureStorage storage, @Named('key') String? key)
      : this._(
          storage,
          key ?? 'default',
        );

  String get _accessTokenKey => '$_prefix/$key/accessToken';

  String get _refreshTokenKey => '$_prefix/$key/refreshToken';

  String get _tokenExpiresTime => '$_prefix/$key/tokenExpiresTime';

  String get _loginInfoKey => '$_prefix/$key/loginInfo';

  String get _rememberLoginInfoFlagKey => '$_prefix/$key/rememberLoginInfo';

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey).onError((_, __) => null);
  }

  @override
  Future<Map<String, dynamic>?> getAuthenticatedHeaders(
      Map<String, dynamic> headers) async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      return headers;
    }

    return {
      ...headers,
      'Authorization': 'Bearer $accessToken',
    };
  }

  @override
  Future<String?> getRefreshToken() {
    return _storage.read(key: _refreshTokenKey).onError((_, __) => null);
  }

  @override
  Future<void> removeAllTokens() async {
    Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  @override
  Future<void> saveAccessToken(String? token) {
    return _storage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<void> saveRefreshToken(String? token) {
    return _storage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<void> logout() async {
    await removeAllTokens();
  }

  @override
  Future<void> saveTokenExpiresTime(String? expiresAt) {
    return _storage.write(key: _tokenExpiresTime, value: expiresAt);
  }

  @override
  Future<String?> getTokenExpiresTime() {
    return _storage.read(key: _tokenExpiresTime).onError((_, __) => null);
  }

  @override
  Future<void> saveLoginInfo(LoginParams loginInfo) {
    return _storage.write(
        key: _loginInfoKey, value: json.encode(loginInfo.toJson()));
  }

  @override
  Future<LoginParams?> getLoginInfo() {
    return _storage.read(key: _loginInfoKey).then((value) {
      if (value != null) LoginParams.fromJson(jsonDecode(value));
    }).onError((_, __) => null);
  }


  @override
  Future<String?> getRememberLoginInfoFlag() {
    return _storage.read(key: _rememberLoginInfoFlagKey).onError((_, __) => null);
  }

  @override
  Future<void> saveRememberLoginInfoFlag(String flag) {
    return _storage.write(
        key: _rememberLoginInfoFlagKey, value: flag);
  }
}
