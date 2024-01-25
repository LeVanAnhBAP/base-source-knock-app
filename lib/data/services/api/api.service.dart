import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:uq_system_app/core/bases/responses/base_error_response.dart';
import 'package:uq_system_app/core/exceptions/network_exception.dart';
import 'package:uq_system_app/core/exceptions/unauthorized_exception.dart';
import 'package:uq_system_app/core/exceptions/unknown_exception.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/data/services/auth/auth.services.dart';
import 'package:uq_system_app/data/sources/network/network_urls.dart';

class ApiServices extends DioForNative implements Interceptor {
  final AuthServices _authServices;

  ApiServices._(this._authServices, BaseOptions options) : super(options);

  factory ApiServices({
    required AuthServices authRepository,
    required String baseUrl,
    Map<String, dynamic> headers = const {},
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(minutes: 5),
    );

    final instance = ApiServices._(
      authRepository,
      options,
    );

    instance.interceptors.add(instance);

    return instance;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorType = err.type;
    final statusCode = err.response?.statusCode;

    if (err.error is SocketException ||
        errorType == DioExceptionType.connectionTimeout ||
        errorType == DioExceptionType.receiveTimeout ||
        errorType == DioExceptionType.sendTimeout) {
      return handler.next(NetworkException());
    }

    if (statusCode == 401) {
      return handler.next(UnauthorizedException());
    }
    return handler.next(UnknownException(
        BaseErrorResponse.fromJson(err.response?.data)));
  }

  @override
  Future<void> onRequest(
      RequestOptions originalOptions, RequestInterceptorHandler handler) async {
    final options = originalOptions.copyWith();
    if (NetworkUrls.requireAuthentication(options.path)) {
      options.headers =
          await _authServices.getAuthenticatedHeaders(options.headers);
    }
    options.headers =
        await _authServices.getAuthenticatedHeaders(options.headers);
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path == NetworkUrls.login &&
        response.data is Map) {
      final accessToken = response.data['data']?['access_token'];
      if (accessToken != null) await _authServices.saveAccessToken(accessToken);
      final expiresAt = response.data['data']?['expires_at'];
      if (expiresAt != null)  await _authServices.saveTokenExpiresTime(expiresAt);
    }

    if (response.requestOptions.path == NetworkUrls.logout) {
      await _authServices.removeAllTokens();
    }

    if (NetworkUrls.requireAuthentication(response.requestOptions.path) &&
        response.data is Map) {
      final accessToken = response.data['new_token']?['access_token'];
      if (accessToken != null) await _authServices.saveAccessToken(accessToken);
      final expiresAt = response.data['new_token']?['expires_at'];
      if (expiresAt != null)  await _authServices.saveTokenExpiresTime(expiresAt);
    }
    return handler.next(response);
  }

  Future<void> saveAuth(Response response) async {
    final accessToken = response.data['new_token']?['access_token'];
    if (accessToken == null) return;
    await _authServices.saveAccessToken(accessToken);
    final expiresAt = response.data['new_token']?['expires_at'];
    if (expiresAt == null) return;
    await _authServices.saveTokenExpiresTime(expiresAt);
  }

  void setLocale(language) {}
}
