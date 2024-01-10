

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@lazySingleton
class ResetPasswordUseCase extends UseCase<void, ResetPassParams>{
  final UserRepository _repository;
  ResetPasswordUseCase(this._repository);
  @override
  Future<void> call(ResetPassParams params) {
    return _repository.resetPassword(params);
  }

}