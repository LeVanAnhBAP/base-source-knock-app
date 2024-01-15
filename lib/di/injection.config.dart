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
    as _i12;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i22;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i23;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i24;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i25;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i3;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i14;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i15;
import 'package:uq_system_app/data/sources/local/local.dart' as _i17;
import 'package:uq_system_app/data/sources/network/network.dart' as _i6;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i29;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i18;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i31;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i27;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i16;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i19;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i32;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i20;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i26;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i33;
import 'package:uq_system_app/di/register_module.dart' as _i37;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i35;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i36;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i34;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i4;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i28;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i30;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i21;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i7;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i10;

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
    gh.lazySingleton<_i12.SiteRepository>(
        () => _i13.SiteRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i14.AuthServices>(() => _i15.AuthServicesImpl(
          gh<_i5.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i16.ChangeFavoritePartnerStateUseCase>(() =>
        _i16.ChangeFavoritePartnerStateUseCase(gh<_i8.PartnerRepository>()));
    gh.lazySingleton<_i17.LocalDataSource>(() => _i17.LocalDataSource(
          gh<_i11.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i18.Logout>(() => _i18.Logout(gh<_i14.AuthServices>()));
    gh.lazySingleton<_i19.PaginatePartnerUseCase>(
        () => _i19.PaginatePartnerUseCase(gh<_i8.PartnerRepository>()));
    gh.lazySingleton<_i20.PaginateSiteUseCase>(
        () => _i20.PaginateSiteUseCase(gh<_i12.SiteRepository>()));
    gh.lazySingleton<_i21.SearchBloc>(() => _i21.SearchBloc(
          gh<_i19.PaginatePartnerUseCase>(),
          gh<_i16.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.lazySingleton<_i22.SystemRepository>(
        () => _i23.SystemRepositoryImpl(gh<_i17.LocalDataSource>()));
    gh.lazySingleton<_i24.UserRepository>(() => _i25.UserRepositoryImpl(
          gh<_i17.LocalDataSource>(),
          gh<_i6.NetworkDataSource>(),
        ));
    gh.factory<_i26.GetAccountUseCase>(
        () => _i26.GetAccountUseCase(gh<_i24.UserRepository>()));
    gh.lazySingleton<_i27.GetUserById>(
        () => _i27.GetUserById(gh<_i24.UserRepository>()));
    gh.lazySingleton<_i28.HomeBloc>(
        () => _i28.HomeBloc(gh<_i20.PaginateSiteUseCase>()));
    gh.lazySingleton<_i29.LoginUseCase>(
        () => _i29.LoginUseCase(gh<_i24.UserRepository>()));
    gh.factory<_i30.OnSiteBloc>(
        () => _i30.OnSiteBloc(gh<_i20.PaginateSiteUseCase>()));
    gh.lazySingleton<_i31.ResetPasswordUseCase>(
        () => _i31.ResetPasswordUseCase(gh<_i24.UserRepository>()));
    gh.lazySingleton<_i32.SaveLanguage>(
        () => _i32.SaveLanguage(gh<_i22.SystemRepository>()));
    gh.factory<_i33.UpdateAvatarUseCase>(
        () => _i33.UpdateAvatarUseCase(gh<_i24.UserRepository>()));
    gh.factory<_i34.AccountBloc>(
        () => _i34.AccountBloc(gh<_i26.GetAccountUseCase>()));
    gh.lazySingleton<_i35.AuthBloc>(() => _i35.AuthBloc(
          gh<_i18.Logout>(),
          gh<_i29.LoginUseCase>(),
          gh<_i26.GetAccountUseCase>(),
          gh<_i33.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i36.ResetPasswordBloc>(
        () => _i36.ResetPasswordBloc(gh<_i31.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i37.RegisterModule {}
