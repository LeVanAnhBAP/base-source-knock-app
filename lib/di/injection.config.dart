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
import 'package:shared_preferences/shared_preferences.dart' as _i11;
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart'
    as _i8;
import 'package:uq_system_app/data/repositories/partner/partner.repository.impl.dart'
    as _i9;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i14;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i23;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i24;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i25;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i26;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i3;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i15;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i16;
import 'package:uq_system_app/data/sources/local/local.dart' as _i18;
import 'package:uq_system_app/data/sources/network/network.dart' as _i6;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i30;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i19;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i32;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i28;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i17;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i20;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i33;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i21;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i27;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i34;
import 'package:uq_system_app/di/register_module.dart' as _i38;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i36;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i37;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i35;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i4;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i29;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i31;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i22;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i7;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i10;
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart'
    as _i12;

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
    gh.lazySingleton<_i3.ApiServices>(
        () => registerModule.registerApiService());
    gh.factory<_i4.ChatBloc>(() => _i4.ChatBloc());
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.lazySingleton<_i6.NetworkDataSource>(
        () => registerModule.registerNetworkDataSource(gh<_i3.ApiServices>()));
    gh.factory<_i7.NotificationBloc>(() => _i7.NotificationBloc());
    gh.lazySingleton<_i8.PartnerRepository>(
        () => _i9.PartnerRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.factory<_i10.ScheduleDetailsBloc>(() => _i10.ScheduleDetailsBloc());
    await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i12.SiteDetailsBloc>(() => _i12.SiteDetailsBloc());
    gh.lazySingleton<_i13.SiteRepository>(
        () => _i14.SiteRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i15.AuthServices>(() => _i16.AuthServicesImpl(
          gh<_i5.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i17.ChangeFavoritePartnerStateUseCase>(() =>
        _i17.ChangeFavoritePartnerStateUseCase(gh<_i8.PartnerRepository>()));
    gh.lazySingleton<_i18.LocalDataSource>(() => _i18.LocalDataSource(
          gh<_i11.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i19.Logout>(() => _i19.Logout(gh<_i15.AuthServices>()));
    gh.lazySingleton<_i20.PaginatePartnerUseCase>(
        () => _i20.PaginatePartnerUseCase(gh<_i8.PartnerRepository>()));
    gh.lazySingleton<_i21.PaginateSiteUseCase>(
        () => _i21.PaginateSiteUseCase(gh<_i13.SiteRepository>()));
    gh.lazySingleton<_i22.SearchBloc>(() => _i22.SearchBloc(
          gh<_i20.PaginatePartnerUseCase>(),
          gh<_i17.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.lazySingleton<_i23.SystemRepository>(
        () => _i24.SystemRepositoryImpl(gh<_i18.LocalDataSource>()));
    gh.lazySingleton<_i25.UserRepository>(() => _i26.UserRepositoryImpl(
          gh<_i18.LocalDataSource>(),
          gh<_i6.NetworkDataSource>(),
        ));
    gh.factory<_i27.GetAccountUseCase>(
        () => _i27.GetAccountUseCase(gh<_i25.UserRepository>()));
    gh.lazySingleton<_i28.GetUserById>(
        () => _i28.GetUserById(gh<_i25.UserRepository>()));
    gh.lazySingleton<_i29.HomeBloc>(
        () => _i29.HomeBloc(gh<_i21.PaginateSiteUseCase>()));
    gh.lazySingleton<_i30.LoginUseCase>(
        () => _i30.LoginUseCase(gh<_i25.UserRepository>()));
    gh.factory<_i31.OnSiteBloc>(
        () => _i31.OnSiteBloc(gh<_i21.PaginateSiteUseCase>()));
    gh.lazySingleton<_i32.ResetPasswordUseCase>(
        () => _i32.ResetPasswordUseCase(gh<_i25.UserRepository>()));
    gh.lazySingleton<_i33.SaveLanguage>(
        () => _i33.SaveLanguage(gh<_i23.SystemRepository>()));
    gh.factory<_i34.UpdateAvatarUseCase>(
        () => _i34.UpdateAvatarUseCase(gh<_i25.UserRepository>()));
    gh.factory<_i35.AccountBloc>(
        () => _i35.AccountBloc(gh<_i27.GetAccountUseCase>()));
    gh.lazySingleton<_i36.AuthBloc>(() => _i36.AuthBloc(
          gh<_i19.Logout>(),
          gh<_i30.LoginUseCase>(),
          gh<_i27.GetAccountUseCase>(),
          gh<_i34.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i37.ResetPasswordBloc>(
        () => _i37.ResetPasswordBloc(gh<_i32.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i38.RegisterModule {}
