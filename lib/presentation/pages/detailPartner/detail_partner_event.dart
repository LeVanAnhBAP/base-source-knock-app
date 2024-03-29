import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'detail_partner_event.freezed.dart';

@freezed
class DetailPartnerEvent with _$DetailPartnerEvent {
  const factory DetailPartnerEvent.errorOccurred([BaseException? error]) =
  DetailPartnerErrorOccurred;
  const factory DetailPartnerEvent.getDataStarted() = DetailPartnerGetDataStarted;
}
