

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class GetSiteDetailsUseCase extends UseCase<SiteDetailsResponse, int>{
  final SiteRepository _repository;
  GetSiteDetailsUseCase(this._repository);
  @override
  Future<SiteDetailsResponse> call(int params) {
    return _repository.getSiteDetails(params);
  }

}