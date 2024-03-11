import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:uq_system_app/data/models/request/company_nearby_params.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

import '../../models/response/company_response.dart';

@LazySingleton(as: SiteRepository)
class SiteRepositoryImpl extends SiteRepository {
  final NetworkDataSource _networkDataSource;

  SiteRepositoryImpl(this._networkDataSource);

  @override
  Future<List<SiteResponse>> paginateSite(PaginateSiteParams request) async {
    var result = await _networkDataSource.paginateSite(
        request.page, request.startDayRequest, request.name);
    return result.data!.data;
  }

  @override
  Future<TaxRateResponse> getTaxRate(String name) async {
    var result = await _networkDataSource.getTaxRate(name);
    return result.data!.first;
  }

  @override
  Future<List<ImageResponse>> upLoadImages(List<File> images) async {
    //TODO: Implement multi images
    var result = await _networkDataSource.uploadImages("", images[0]);
    return result.data!;
  }

  @override
  Future<void> createSite(SiteParams siteParams) async {
    var result = await _networkDataSource.createSite(siteParams);
    return result.data!;
  }

  @override
  Future<SiteDetailsResponse> getSiteDetails(int siteId) async {
    var result = await _networkDataSource.getSiteDetails(siteId);
    return result.data!;
  }

  @override
  Future<void> updateSite(SiteParams siteParams) async {
    var result = await _networkDataSource.updateSite(siteParams.id!, siteParams);
    return result.data!;
  }

  @override
  Future<List<CompanyResponse>> getCompaniesNearby(CompanyNearbyParams request) async {
    var result = await _networkDataSource.getCompaniesNearby(request.siteId, request.distance);
    return result.data!;
  }

  @override
  Future<void> removeSite(int siteId) async{
    await _networkDataSource.removeSite(siteId);
  }
}
