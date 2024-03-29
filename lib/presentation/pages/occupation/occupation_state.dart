import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';

part 'occupation_state.freezed.dart';

enum OccupationStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class OccupationState with _$OccupationState {
  const factory OccupationState({
    @Default(<OccupationMajorResponse>[]) List<OccupationMajorResponse> searchedOccupation,
    @Default(<OccupationMajorResponse>[]) List<OccupationMajorResponse> occupations,
    @Default(OccupationStatus.initial) OccupationStatus status,
    BaseException? error,
  }) = _OccupationState;
}
