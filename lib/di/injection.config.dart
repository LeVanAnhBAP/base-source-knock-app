// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i14;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i15;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i16;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i4;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i9;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i10;
import 'package:uq_system_app/data/sources/local/local.dart' as _i11;
import 'package:uq_system_app/data/sources/network/network.dart' as _i7;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i17;
import 'package:uq_system_app/data/usecases/login_usecase.dart' as _i18;
import 'package:uq_system_app/data/usecases/logout.dart' as _i12;
import 'package:uq_system_app/data/usecases/resetpassword_usecase.dart' as _i19;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i20;
import 'package:uq_system_app/di/register_module.dart' as _i23;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i21;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i22;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i3;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AccountBloc>(() => _i3.AccountBloc());
    gh.lazySingleton<_i4.ApiServices>(
        () => registerModule.registerApiservice());
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.lazySingleton<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.lazySingleton<_i7.NetworkDataSource>(
        () => registerModule.registerNetworkDataSourcer(gh<_i4.ApiServices>()));
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i9.AuthServices>(() => _i10.AuthServicesImpl(
          gh<_i5.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i11.LocalDataSource>(() => _i11.LocalDataSource(
          gh<_i8.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i12.Logout>(() => _i12.Logout(gh<_i9.AuthServices>()));
    gh.lazySingleton<_i13.SystemRepository>(
        () => _i14.SystemRepositoryImpl(gh<_i11.LocalDataSource>()));
    gh.lazySingleton<_i15.UserRepository>(() => _i16.UserRepositoryImpl(
          gh<_i9.AuthServices>(),
          gh<_i7.NetworkDataSource>(),
        ));
    gh.lazySingleton<_i17.GetUserById>(
        () => _i17.GetUserById(gh<_i15.UserRepository>()));
    gh.lazySingleton<_i18.LoginUseCase>(
        () => _i18.LoginUseCase(gh<_i15.UserRepository>()));
    gh.lazySingleton<_i19.ResetPasswordUsecase>(
        () => _i19.ResetPasswordUsecase(gh<_i15.UserRepository>()));
    gh.lazySingleton<_i20.SaveLanguage>(
        () => _i20.SaveLanguage(gh<_i13.SystemRepository>()));
    gh.lazySingleton<_i21.AuthBloc>(() => _i21.AuthBloc(
          gh<_i12.Logout>(),
          gh<_i18.LoginUseCase>(),
          gh<_i19.ResetPasswordUsecase>(),
        ));
    gh.factory<_i22.ResetPasswordBloc>(
        () => _i22.ResetPasswordBloc(gh<_i19.ResetPasswordUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
