

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@lazySingleton
class ResetPasswordUsecase extends EitherUseCase<void, ResetPassParams>{
  final UserRepository _repository;
  ResetPasswordUsecase(this._repository);
  @override
  Future<Either<BaseException, void>> call(ResetPassParams params) {
    return _repository.resetPassword(params);
  }

}