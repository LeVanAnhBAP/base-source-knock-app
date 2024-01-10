

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/paginate_partner_params.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as : PartnerRepository)
class PartnerRepositoryImpl extends PartnerRepository{
    final NetworkDataSource _networkDataSource;
  PartnerRepositoryImpl(this._networkDataSource);
  @override
  Future<List<PartnerResponse>> panigatePartner(PaginatePartnerParams request) async {
  var result = await _networkDataSource.paginatePartner(request.page, request.perPage);
    return result.data.data;
  }

}