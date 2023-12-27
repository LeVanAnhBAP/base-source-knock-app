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
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i15;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i16;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i17;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i18;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i4;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i11;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i12;
import 'package:uq_system_app/data/sources/local/local.dart' as _i13;
import 'package:uq_system_app/data/sources/network/network.dart' as _i7;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i19;
import 'package:uq_system_app/data/usecases/login_usecase.dart' as _i20;
import 'package:uq_system_app/data/usecases/logout.dart' as _i14;
import 'package:uq_system_app/data/usecases/resetpassword_usecase.dart' as _i21;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i22;
import 'package:uq_system_app/di/register_module.dart' as _i25;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i23;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i24;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i3;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i6;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i8;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i9;

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
    gh.factory<_i8.NotificationBloc>(() => _i8.NotificationBloc());
    gh.factory<_i9.ScheduleDetailsBloc>(() => _i9.ScheduleDetailsBloc());
    await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i11.AuthServices>(() => _i12.AuthServicesImpl(
          gh<_i5.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i13.LocalDataSource>(() => _i13.LocalDataSource(
          gh<_i10.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i14.Logout>(() => _i14.Logout(gh<_i11.AuthServices>()));
    gh.lazySingleton<_i15.SystemRepository>(
        () => _i16.SystemRepositoryImpl(gh<_i13.LocalDataSource>()));
    gh.lazySingleton<_i17.UserRepository>(() => _i18.UserRepositoryImpl(
          gh<_i11.AuthServices>(),
          gh<_i7.NetworkDataSource>(),
        ));
    gh.lazySingleton<_i19.GetUserById>(
        () => _i19.GetUserById(gh<_i17.UserRepository>()));
    gh.lazySingleton<_i20.LoginUseCase>(
        () => _i20.LoginUseCase(gh<_i17.UserRepository>()));
    gh.lazySingleton<_i21.ResetPasswordUsecase>(
        () => _i21.ResetPasswordUsecase(gh<_i17.UserRepository>()));
    gh.lazySingleton<_i22.SaveLanguage>(
        () => _i22.SaveLanguage(gh<_i15.SystemRepository>()));
    gh.lazySingleton<_i23.AuthBloc>(() => _i23.AuthBloc(
          gh<_i14.Logout>(),
          gh<_i20.LoginUseCase>(),
          gh<_i21.ResetPasswordUsecase>(),
        ));
    gh.factory<_i24.ResetPasswordBloc>(
        () => _i24.ResetPasswordBloc(gh<_i21.ResetPasswordUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {}
