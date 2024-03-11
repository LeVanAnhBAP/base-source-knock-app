
import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_info_response.freezed.dart';
part 'address_info_response.g.dart';
@freezed
class AddressInfoResponse with _$AddressInfoResponse{
  const factory AddressInfoResponse({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'created_at')  String? createdAt,
    @JsonKey(name: 'updated_at')  String? updatedAt,
    @JsonKey(name: 'deleted_at')  String? deletedAt,
}) = _AddressInfoResponse;
  factory AddressInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoResponseFromJson(json);
}