

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/occupation_response.dart';

import '../../../domain/entities/member.dart';

part 'create_site_event.freezed.dart';

@freezed
class CreateSiteEvent with _$CreateSiteEvent {
  const factory CreateSiteEvent.errorOccurred([BaseException? error]) = CreateSiteErrorOccurred;
  const factory CreateSiteEvent.loadInfo({int? siteId,required int userId}) = CreateSiteLoadInfo;
  const factory CreateSiteEvent.updateMembers({required List<Member> newMembers}) = CreateSiteUpdateMembers;
  const factory CreateSiteEvent.removeMember({required int id}) = CreateSiteRemoveMemeber;
  const factory CreateSiteEvent.updateOccupation({required OccupationResponse occupation}) = CreateSiteUpdateOccupation;
  const factory CreateSiteEvent.updateParams({required SiteParams siteParams}) = CreateSiteUpdateParams;
  const factory CreateSiteEvent.selectPrefecture({required int prefectureId}) = CreateSiteSelectPrefecture;
  const factory CreateSiteEvent.selectCity({required int cityId}) = CreateSiteSelectCity;
  const factory CreateSiteEvent.selectTown({required int townId}) = CreateSiteSelectTown;
  const factory CreateSiteEvent.updateOrders({required List<PriceOrderDetailModel> priceOrders, required int totalAmount}) = CreateSiteUpdateOrders;
  const factory CreateSiteEvent.addImages({required List<File> images, required int imageType}) = CreateSiteAddImages;
  const factory CreateSiteEvent.removeImage({required int index, required int imageType}) = CreateSiteRemoveImage;
  const factory CreateSiteEvent.submit({required bool isDaft}) = CreateSiteSubmit;
}
