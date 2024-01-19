

import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
@freezed
class Member with _$Member{
  const factory Member({
    @Default(0) int id,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String firstNameKana,
    @Default("") String lastNameKana,
    @Default(0)  int roleId,
    @Default(0)  int role,
    @Default(false) bool isSelected,
  }) = _Member;
}