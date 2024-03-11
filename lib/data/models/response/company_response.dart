
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_response.dart';
part "company_response.freezed.dart";
part "company_response.g.dart";
@freezed
class CompanyResponse with _$CompanyResponse{
  const factory CompanyResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email')  String? email,
    @JsonKey(name: 'furigana') required String furigana,
    @JsonKey(name: 'name_kana') required String nameKana,
    @JsonKey(name : 'logo') ImageResponse? logo,
    @JsonKey(name: 'intro') String? intro,
    @JsonKey(name: 'self_intro') String? selfIntro,
    @JsonKey(name: 'latitude')  String? latitude,
    @JsonKey(name: 'longitude')  String? longitude,
    @JsonKey(name: 'invoice_number')  String? invoiceNumber,
    @JsonKey(name: 'postal_code')  String? postalCode,
    @JsonKey(name: 'buildings')  String? building,
    @JsonKey(name: 'location_municipality')  String? locationMunicipality,
    @JsonKey(name: 'location_below')  String? locationBelow,
    @JsonKey(name: 'tel_number')  String? telNumber,
    @JsonKey(name: 'work_place')  String? workPlace,
    @JsonKey(name: 'hp_url')  String? hpUrl,
    @JsonKey(name : 'type') int? type,
    @JsonKey(name : 'background')  ImageResponse? background,
  }) = _CompanyResponse;
   factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);
}