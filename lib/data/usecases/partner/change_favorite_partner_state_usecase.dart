import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/favorite_partner_params.dart';
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart';

@injectable
class ChangeFavoritePartnerStateUseCase
    extends UseCase<void, FavoritePartnerParams> {
  final PartnerRepository _repository;

  ChangeFavoritePartnerStateUseCase(this._repository);

  @override
  Future<void> call(FavoritePartnerParams params) {
    return _repository.changeFavoritePartnerState(params);
  }
}
