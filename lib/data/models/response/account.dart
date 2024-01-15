import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';

part 'account.freezed.dart';

part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'first_name_kana') String? firstNameKana,
    @JsonKey(name: 'last_name_kana') String? lastNameKana,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'role') required int role,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'tel_number') String? telNumber,
    @JsonKey(name: 'password_readable') String? passwordReadable,
    @JsonKey(name: 'bank_name') String? bankName,
    @JsonKey(name: 'bank_account_type') int? bankAccountType,
    @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
    @JsonKey(name: 'bank_branch_name') String? bankBranchName,
    @JsonKey(name: 'bank_account_name') String? bankAccountName,
    @JsonKey(name: 'company') required CompanyResponse company,
    @JsonKey(name: 'avatar') ImageResponse? avatar,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
