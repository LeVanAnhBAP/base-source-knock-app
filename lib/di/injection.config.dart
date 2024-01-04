// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i12;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i19;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i20;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i21;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i22;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i4;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i14;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i15;
import 'package:uq_system_app/data/sources/local/local.dart' as _i16;
import 'package:uq_system_app/data/sources/network/network.dart' as _i7;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i26;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i17;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i28;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i24;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i29;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i18;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i23;
import 'package:uq_system_app/di/register_module.dart' as _i32;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i30;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i31;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i3;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i5;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i25;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i27;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i10;
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
    gh.factory<_i5.ChatBloc>(() => _i5.ChatBloc());
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.lazySingleton<_i7.NetworkDataSource>(
        () => registerModule.registerNetworkDataSourcer(gh<_i4.ApiServices>()));
    gh.factory<_i8.NotificationBloc>(() => _i8.NotificationBloc());
    gh.factory<_i9.ScheduleDetailsBloc>(() => _i9.ScheduleDetailsBloc());
    gh.factory<_i10.SearchBloc>(() => _i10.SearchBloc());
    await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i12.SiteRepository>(
        () => _i13.SiteRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i14.AuthServices>(() => _i15.AuthServicesImpl(
          gh<_i6.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i16.LocalDataSource>(() => _i16.LocalDataSource(
          gh<_i11.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i17.Logout>(() => _i17.Logout(gh<_i14.AuthServices>()));
    gh.lazySingleton<_i18.PaginateSiteUseCase>(
        () => _i18.PaginateSiteUseCase(gh<_i12.SiteRepository>()));
    gh.lazySingleton<_i19.SystemRepository>(
        () => _i20.SystemRepositoryImpl(gh<_i16.LocalDataSource>()));
    gh.lazySingleton<_i21.UserRepository>(() => _i22.UserRepositoryImpl(
          gh<_i16.LocalDataSource>(),
          gh<_i7.NetworkDataSource>(),
        ));
    gh.factory<_i23.GetAccountUseCase>(
        () => _i23.GetAccountUseCase(gh<_i21.UserRepository>()));
    gh.lazySingleton<_i24.GetUserById>(
        () => _i24.GetUserById(gh<_i21.UserRepository>()));
    gh.lazySingleton<_i25.HomeBloc>(() => _i25.HomeBloc(
          gh<_i18.PaginateSiteUseCase>(),
          gh<_i23.GetAccountUseCase>(),
        ));
    gh.lazySingleton<_i26.LoginUseCase>(
        () => _i26.LoginUseCase(gh<_i21.UserRepository>()));
    gh.factory<_i27.OnSiteBloc>(() => _i27.OnSiteBloc(
          gh<_i18.PaginateSiteUseCase>(),
          gh<_i23.GetAccountUseCase>(),
        ));
    gh.lazySingleton<_i28.ResetPasswordUsecase>(
        () => _i28.ResetPasswordUsecase(gh<_i21.UserRepository>()));
    gh.lazySingleton<_i29.SaveLanguage>(
        () => _i29.SaveLanguage(gh<_i19.SystemRepository>()));
    gh.lazySingleton<_i30.AuthBloc>(() => _i30.AuthBloc(
          gh<_i17.Logout>(),
          gh<_i26.LoginUseCase>(),
          gh<_i28.ResetPasswordUsecase>(),
        ));
    gh.factory<_i31.ResetPasswordBloc>(
        () => _i31.ResetPasswordBloc(gh<_i28.ResetPasswordUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i32.RegisterModule {}
