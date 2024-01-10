

import 'package:uq_system_app/data/models/request/paginate_partner_params.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';

abstract class PartnerRepository{
  Future<List<PartnerResponse>> panigatePartner(PaginatePartnerParams request);
}