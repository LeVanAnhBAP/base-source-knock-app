
import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_response.freezed.dart';
part 'member_response.g.dart';
@freezed
class MemberResponse with _$MemberResponse{
  const factory MemberResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'first_name_kana') String? firstNameKana,
    @JsonKey(name: 'last_name_kana') String? lastNameKana,
    @JsonKey(name: 'role_id') required int roleId,
    @JsonKey(name: 'role') required int role,
}) = _MemberReponse;
  factory MemberResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberResponseFromJson(json);
}