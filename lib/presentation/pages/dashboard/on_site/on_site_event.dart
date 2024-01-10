import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'on_site_event.freezed.dart';

@freezed
class OnSiteEvent with _$OnSiteEvent {
  const factory OnSiteEvent.errorOccurred([BaseException? error]) = OnSiteErrorOccurred;
  const factory OnSiteEvent.onLoad() = OnSiteLoad;
  const factory OnSiteEvent.onLoadMore() = OnSiteLoadMore;
  const factory OnSiteEvent.onSearch(String name) = OnSiteSearch;
}
