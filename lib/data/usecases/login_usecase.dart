import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@lazySingleton
class LoginUseCase extends EitherUseCase<void, LoginParams> {
  final UserRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<BaseException, void>> call(LoginParams params) {
    return _repository.login(params);
  }
}
