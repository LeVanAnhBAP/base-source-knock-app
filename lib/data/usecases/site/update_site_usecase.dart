
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class UpdateSiteUseCase extends UseCase<void , SiteParams>{
  final SiteRepository _repository;
  UpdateSiteUseCase(this._repository);
  @override
  Future<void> call(SiteParams params) {
    return _repository.updateSite(params);
  }

}