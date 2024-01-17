
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/common_item_response.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';
import 'package:uq_system_app/data/models/response/work_area_reponse.dart';
part 'static_data_response.freezed.dart';
part 'static_data_response.g.dart';
@freezed
class StaticDataResponse with _$StaticDataResponse{
  const factory StaticDataResponse({
    @JsonKey(name: 'work_areas') required List<WorkAreaResponse> workAreas,
    @JsonKey(name: 'occupations') required List<OccupationResponse> occupations,
    @JsonKey(name: 'other_insurances') required List<CommonItemResponse> otherInsurances,
    @JsonKey(name: 'unit') required List<CommonItemResponse> unit,
}) = _StaticDataResponse;
  factory StaticDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StaticDataResponseFromJson(json);
}