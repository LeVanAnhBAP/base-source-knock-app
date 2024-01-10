
import 'package:uq_system_app/core/entities/user.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/models/response/account.dart';

abstract class UserRepository {
  Future<User> getUserById(String userId);
   Future<Account> login(LoginParams loginParams);
   Future<void> resetPassword(ResetPassParams resetPassParams);
   Future<Account?> getAccount() ;
}
