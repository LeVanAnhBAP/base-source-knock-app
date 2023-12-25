import 'package:dartz/dartz.dart';
import 'package:uq_system_app/core/entities/user.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';

abstract class UserRepository {
  Future<User> getUserById(String userId);
   Future<Either<BaseException, void>> login(LoginParams loginParams);
}
