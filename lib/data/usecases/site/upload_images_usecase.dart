

import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/image_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';

@injectable
class UploadImagesUseCase extends UseCase<List<ImageResponse>, List<File>>{
  final SiteRepository _repository;
  UploadImagesUseCase(this._repository);
  @override
  Future<List<ImageResponse>> call(List<File> params) {
    return _repository.upLoadImages(params);
  }

}