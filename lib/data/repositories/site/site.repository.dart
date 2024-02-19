

import 'dart:io';

import 'package:uq_system_app/data/models/request/company_nearby_params.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';

abstract class SiteRepository{
  Future<List<SiteResponse>> paginateSite(PaginateSiteParams request);
  Future<SiteDetailsResponse> getSiteDetails(int siteId);
  Future<void> createSite(SiteParams siteParams);
  Future<void> updateSite(SiteParams siteParams);
  Future<void> removeSite(int siteId);
  Future<TaxRateResponse> getTaxRate(String name);
  Future<List<ImageResponse>> upLoadImages(List<File> images);
  Future<List<CompanyResponse>> getCompaniesNearby(CompanyNearbyParams request);
}