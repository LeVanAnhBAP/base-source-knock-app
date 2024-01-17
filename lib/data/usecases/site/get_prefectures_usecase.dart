


import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/prefecture_response.dart';
import 'package:uq_system_app/data/repositories/prefecture/prefecture.repository.dart';

@injectable
class GetPrefecturesUseCase extends UseCase<List<PrefectureResponse>, NoParams?>{
  final PrefectureRepository _repository;
  GetPrefecturesUseCase(this._repository);
  @override
  Future<List<PrefectureResponse>> call(NoParams? params) {
    return _repository.getPrefectures();
  }

}