

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class GetTaxRateUseCase extends UseCase<TaxRateResponse, String>{
  final SiteRepository _repository;
  GetTaxRateUseCase(this._repository);
  @override
  Future<TaxRateResponse> call(String params) {
    return _repository.getTaxRate(params);
  }

}