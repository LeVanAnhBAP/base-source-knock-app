
import 'package:freezed_annotation/freezed_annotation.dart';
part "company_response.freezed.dart";
part "company_response.g.dart";
@freezed
class CompanyResponse with _$CompanyResponse{
  const factory CompanyResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name : 'type') required int type
  }) = _CompanyResponse;
   factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);
}