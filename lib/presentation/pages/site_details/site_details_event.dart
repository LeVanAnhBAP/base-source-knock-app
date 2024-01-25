import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'site_details_event.freezed.dart';

@freezed
class SiteDetailsEvent with _$SiteDetailsEvent {
  const factory SiteDetailsEvent.errorOccurred([BaseException? error]) = SiteDetailsErrorOccurred;
  const factory SiteDetailsEvent.loadData({required int siteId}) = SiteDetailsLoadData;
}
