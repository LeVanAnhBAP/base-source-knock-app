
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/data/models/response/common_item_response.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';
import 'package:uq_system_app/data/models/response/work_area_reponse.dart';
part 'static_data_response.freezed.dart';
part 'static_data_response.g.dart';
@freezed
class StaticDataResponse with _$StaticDataResponse{
  const factory StaticDataResponse({
    @JsonKey(name: 'work_areas')  List<WorkAreaResponse>? workAreas,
    @JsonKey(name: 'occupations')  List<OccupationMajorResponse>? occupations,
    @JsonKey(name: 'other_insurances')  List<CommonItemResponse>? otherInsurances,
    @JsonKey(name: 'units')  List<CommonItemResponse>? units,
}) = _StaticDataResponse;
  factory StaticDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StaticDataResponseFromJson(json);
}