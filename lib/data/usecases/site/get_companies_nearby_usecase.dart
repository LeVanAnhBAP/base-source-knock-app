

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/company_nearby_params.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class GetCompaniesNearbyUseCase extends UseCase<List<CompanyResponse>, CompanyNearbyParams>{
  final SiteRepository _repository;
  GetCompaniesNearbyUseCase(this._repository);
  @override
  Future<List<CompanyResponse>> call(CompanyNearbyParams params) {
    return _repository.getCompaniesNearby(params);
  }

}