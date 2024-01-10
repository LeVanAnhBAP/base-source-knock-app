

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/paginate_partner_params.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart';

@lazySingleton
class PaginatePartnerUseCase extends UseCase<List<PartnerResponse>, PaginatePartnerParams>{
  final PartnerRepository _repository;
  PaginatePartnerUseCase(this._repository);
  @override
  Future<List<PartnerResponse>> call(PaginatePartnerParams params) {
    return _repository.panigatePartner(params);
  }

}