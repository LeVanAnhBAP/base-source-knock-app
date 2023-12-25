
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/account.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';
@freezed
class LoginResponse with _$LoginResponse{
  const factory LoginResponse({
    @JsonKey(name: 'access_token')
    required String accessToken,
    @JsonKey(name: 'token_type')
    String? tokenType,
    @JsonKey(name: 'expires_at')
    required String expiresAt,
     @JsonKey(name: 'user')
    required Account account
  }) = _$LoginReponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}