import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
