

import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@injectable
class UpdateAvatarUseCase extends UseCase<void, File>{
  final UserRepository _repository;
  UpdateAvatarUseCase(this._repository);
  @override
  Future<void> call(File params) {
    return _repository.updateAvatar(params);
  }

}