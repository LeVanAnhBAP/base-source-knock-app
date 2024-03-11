import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/occupation_major_response.dart';

part 'occupation_event.freezed.dart';

@freezed
class OccupationEvent with _$OccupationEvent {
  const factory OccupationEvent.errorOccurred([BaseException? error]) = OccupationErrorOccurred;
  const factory OccupationEvent.receiveData({required List<OccupationMajorResponse> occupations}) = OccupationReceiveData;
  const factory OccupationEvent.search({required String searchText}) = OccupationSearch;
}
