import 'package:dartz/dartz.dart';
import 'package:uq_system_app/core/entities/user.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/models/response/account.dart';

abstract class UserRepository {
  Future<User> getUserById(String userId);
   Future<Either<BaseException, void>> login(LoginParams loginParams);
   Future<Either<BaseException, void>> resetPassword(ResetPassParams resetPassParams);
   Future<Account?> getAccount() ;
}
