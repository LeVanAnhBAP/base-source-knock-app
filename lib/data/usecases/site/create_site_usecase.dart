
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class CreateSiteUseCase extends UseCase<void, SiteParams>{
  final SiteRepository _siteRepository;
  CreateSiteUseCase(this._siteRepository);
  @override
  Future<void> call(SiteParams params) {
    return _siteRepository.createSite(params);
  }
  
}