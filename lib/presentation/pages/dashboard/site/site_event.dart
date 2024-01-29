import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'site_event.freezed.dart';

@freezed
class SiteEvent with _$SiteEvent {
  const factory SiteEvent.errorOccurred([BaseException? error]) =
  SiteErrorOccurred;
  const factory SiteEvent.getDataStarted({String? accessToken}) = DashboardSiteGetDataStarted;
  const factory SiteEvent.loadSearchData({String? accessToken,String? searchText}) = DashboardSiteLoadSearchData;
  const factory SiteEvent.loadMoreData({String? accessToken}) =DashboardSiteLoadMoreData;

}
