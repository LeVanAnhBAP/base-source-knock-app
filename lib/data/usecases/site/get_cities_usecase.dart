

import 'package:injectable/injectable.dart';

import '../../../core/bases/usecases/base_use_case.dart';
import '../../models/response/address_info_response.dart';
import '../../repositories/address_info/address_info.repository.dart';

@injectable
class GetCitiesUseCase extends UseCase<List<AddressInfoResponse>, int>{
  final AddressInfoRepository _repository;
  GetCitiesUseCase(this._repository);
  @override
  Future<List<AddressInfoResponse>> call(int params) {
    return _repository.getCities(params);
  }

}