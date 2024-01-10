import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/entities/user.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/request/reset_pass_params.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/repositories/user/user.repository.dart';
import 'package:uq_system_app/data/sources/local/local.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final LocalDataSource _localDataSource;
  final NetworkDataSource _networkDataSource;
  UserRepositoryImpl(this._localDataSource, this._networkDataSource);
  @override
  Future<User> getUserById(String userId) async {
    return User(id: userId, name: 'John Doe');
  }

  @override
  Future<Account> login(LoginParams loginParams) async {
    var result = await _networkDataSource.login(loginParams);
    await _localDataSource.saveAccount(result.data!.account);
    return result.data!.account;
  }

  @override
  Future<void> resetPassword(ResetPassParams resetPassParams) async {
    await _networkDataSource.resetPassword(
        resetPassParams.email, resetPassParams.type);
  }

  @override
  Future<Account?> getAccount() async {
    try{
      var result = await _networkDataSource.getUserInfo();
      return result.data;
    }
    catch(e){
      var account = await _localDataSource.getAccount();
      return account;
    }
  }
}
