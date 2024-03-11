
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class RemoveSiteUseCase extends UseCase<void, int>{
  final SiteRepository _repository;
  RemoveSiteUseCase(this._repository);
  @override
  Future<void> call(int params) {
    return _repository.removeSite(params);
  }

}