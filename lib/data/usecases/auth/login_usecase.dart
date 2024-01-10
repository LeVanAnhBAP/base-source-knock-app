
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@lazySingleton
class LoginUseCase extends UseCase<Account, LoginParams> {
  final UserRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Account> call(LoginParams params) {
    return _repository.login(params);
  }
}
