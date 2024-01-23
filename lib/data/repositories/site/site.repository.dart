

import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';

abstract class SiteRepository{
  Future<List<SiteResponse>> paginateSite(PaginateSiteParams request);
  Future<TaxRateResponse> getTaxRate(String name);
}