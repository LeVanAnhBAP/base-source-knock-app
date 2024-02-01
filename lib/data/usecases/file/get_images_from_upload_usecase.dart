

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/upload_multi_params.dart';
import 'package:uq_system_app/data/repositories/file/file.repository.dart';

@injectable
class GetImagesFromUploadUseCase extends UseCase<List<String>, UploadMultiParams>{
  final FileRepository _repository;
  GetImagesFromUploadUseCase(this._repository);
  @override
  Future<List<String>> call(UploadMultiParams params) {
    return _repository.getImagesFromUpload(params);
  }

}
