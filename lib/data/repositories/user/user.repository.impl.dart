import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/entities/user.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';
import 'package:uq_system_app/data/services/auth/auth.services.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final AuthServices _authServices;
  final NetworkDataSource _networkDataSource;
  UserRepositoryImpl(this._authServices, this._networkDataSource);
  @override
  Future<User> getUserById(String userId) async {
    return User(id: userId, name: 'John Doe');
  }
  @override
  Future<Either<BaseException, void>> login(LoginParams loginParams) async {
    try {
      var result = await _networkDataSource.login(loginParams);
      //TODO : Save account
      return const Right(null);
    } on BaseException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<BaseException, void>> resetPassword(ResetPassParams resetPassParams) async {
    try {
       await _networkDataSource.resetPassword(resetPassParams.email, resetPassParams.type);
      return const Right(null);
    } on BaseException catch (e) {
      return Left(e);
    }
  }
}
