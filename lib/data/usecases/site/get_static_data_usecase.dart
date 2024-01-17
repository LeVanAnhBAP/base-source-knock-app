

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart';

@injectable
class GetStaticDataUseCase extends UseCase<StaticDataResponse, NoParams?>{
  final StaticDataRepository _staticDataRepository;
  const GetStaticDataUseCase(this._staticDataRepository);
  @override
  Future<StaticDataResponse> call([NoParams? params]) {
    return _staticDataRepository.getStaticData();
  }

}