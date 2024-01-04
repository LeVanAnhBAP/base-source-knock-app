

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';

@injectable
class GetAccountUseCase extends UseCase<Account?, NoParams?>{
  final UserRepository _repository;
  GetAccountUseCase(this._repository);
  @override
  Future<Account?> call([NoParams? params]) {
    return _repository.getAccount();
  }

}