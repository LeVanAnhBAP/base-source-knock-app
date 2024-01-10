
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@lazySingleton
class PaginateSiteUseCase extends UseCase<List<SiteResponse>, PaginateSiteParams>{
  final SiteRepository _siteRepository;
  PaginateSiteUseCase(this._siteRepository);
  
  @override
  Future<List<SiteResponse>> call(PaginateSiteParams params) {
    return _siteRepository.paginateSite(params);
  }


}