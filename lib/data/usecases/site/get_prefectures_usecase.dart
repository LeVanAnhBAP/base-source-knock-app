


import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/address_info_response.dart';

import '../../repositories/address_info/address_info.repository.dart';


@injectable
class GetPrefecturesUseCase extends UseCase<List<AddressInfoResponse>, NoParams?>{
  final AddressInfoRepository _repository;
  GetPrefecturesUseCase(this._repository);
  @override
  Future<List<AddressInfoResponse>> call([NoParams? params]) {
    return _repository.getPrefectures();
  }

}