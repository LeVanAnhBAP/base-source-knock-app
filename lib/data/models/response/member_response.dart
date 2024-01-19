
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/bases/mapper/data_mapper.dart';
import 'package:uq_system_app/domain/entities/member.dart';
part 'member_response.freezed.dart';
part 'member_response.g.dart';
@freezed
class MemberResponse with _$MemberResponse implements DataMapper<Member>{
  const MemberResponse._();
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

  @override
  Member mapToEntity() {
    return Member(
      id: id ,
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      firstNameKana: firstNameKana ?? "",
      lastNameKana: lastNameKana ?? "",
      roleId: roleId,
      role: role
    );
  }
}