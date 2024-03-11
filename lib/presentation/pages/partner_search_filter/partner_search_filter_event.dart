import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'partner_search_filter_event.freezed.dart';

@freezed
class PartnerSearchFilterEvent with _$PartnerSearchFilterEvent {
  const factory PartnerSearchFilterEvent.errorOccurred([BaseException? error]) = PartnerSearchFilterErrorOccurred;
}
