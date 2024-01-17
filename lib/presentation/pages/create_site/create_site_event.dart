import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'create_site_event.freezed.dart';

@freezed
class CreateSiteEvent with _$CreateSiteEvent {
  const factory CreateSiteEvent.errorOccurred([BaseException? error]) = CreateSiteErrorOccurred;
  const factory CreateSiteEvent.loadInfo({required int userId}) = CreateSiteLoadInfo;
}
