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
import 'package:shared_preferences/shared_preferences.dart' as _i15;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.dart'
    as _i21;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.impl.dart'
    as _i22;
import 'package:uq_system_app/data/repositories/member/member.repository.dart'
    as _i32;
import 'package:uq_system_app/data/repositories/member/member.repository.impl.dart'
    as _i33;
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart'
    as _i11;
import 'package:uq_system_app/data/repositories/partner/partner.repository.impl.dart'
    as _i12;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i17;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i18;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart'
    as _i19;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.impl.dart'
    as _i20;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i37;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i38;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i39;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i40;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i3;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i23;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i24;
import 'package:uq_system_app/data/sources/local/local.dart' as _i30;
import 'package:uq_system_app/data/sources/network/network.dart' as _i6;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i45;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i31;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i47;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i43;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i25;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i34;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i48;
import 'package:uq_system_app/data/usecases/site/get_cities_usecase.dart'
    as _i26;
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart'
    as _i42;
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart'
    as _i27;
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart'
    as _i28;
import 'package:uq_system_app/data/usecases/site/get_towns_usecase.dart'
    as _i29;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i35;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i41;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i49;
import 'package:uq_system_app/di/register_module.dart' as _i54;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i51;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i53;
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart'
    as _i52;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i50;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i4;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i44;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i46;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i36;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i7;
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart'
    as _i8;
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart'
    as _i9;
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart'
    as _i10;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i13;
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart'
    as _i14;
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart'
    as _i16;

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
    gh.factory<_i8.OccupationBloc>(() => _i8.OccupationBloc());
    gh.factory<_i9.OrderDetailsBloc>(() => _i9.OrderDetailsBloc());
    gh.factory<_i10.OrderLineBloc>(() => _i10.OrderLineBloc());
    gh.lazySingleton<_i11.PartnerRepository>(
        () => _i12.PartnerRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.factory<_i13.ScheduleDetailsBloc>(() => _i13.ScheduleDetailsBloc());
    gh.factory<_i14.SearchMemberBloc>(() => _i14.SearchMemberBloc());
    await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i16.SiteDetailsBloc>(() => _i16.SiteDetailsBloc());
    gh.lazySingleton<_i17.SiteRepository>(
        () => _i18.SiteRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<_i19.StaticDataRepository>(
        () => _i20.StaticDataRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.lazySingleton<_i21.AddressInfoRepository>(
        () => _i22.AddressInfoRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<_i23.AuthServices>(() => _i24.AuthServicesImpl(
          gh<_i5.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i25.ChangeFavoritePartnerStateUseCase>(() =>
        _i25.ChangeFavoritePartnerStateUseCase(gh<_i11.PartnerRepository>()));
    gh.factory<_i26.GetCitiesUseCase>(
        () => _i26.GetCitiesUseCase(gh<_i21.AddressInfoRepository>()));
    gh.factory<_i27.GetPrefecturesUseCase>(
        () => _i27.GetPrefecturesUseCase(gh<_i21.AddressInfoRepository>()));
    gh.factory<_i28.GetStaticDataUseCase>(
        () => _i28.GetStaticDataUseCase(gh<_i19.StaticDataRepository>()));
    gh.factory<_i29.GetTownsUseCase>(
        () => _i29.GetTownsUseCase(gh<_i21.AddressInfoRepository>()));
    gh.lazySingleton<_i30.LocalDataSource>(() => _i30.LocalDataSource(
          gh<_i15.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i31.Logout>(() => _i31.Logout(gh<_i23.AuthServices>()));
    gh.lazySingleton<_i32.MemberRepository>(
        () => _i33.MemberRepositoryImpl(gh<_i6.NetworkDataSource>()));
    gh.lazySingleton<_i34.PaginatePartnerUseCase>(
        () => _i34.PaginatePartnerUseCase(gh<_i11.PartnerRepository>()));
    gh.lazySingleton<_i35.PaginateSiteUseCase>(
        () => _i35.PaginateSiteUseCase(gh<_i17.SiteRepository>()));
    gh.lazySingleton<_i36.SearchBloc>(() => _i36.SearchBloc(
          gh<_i34.PaginatePartnerUseCase>(),
          gh<_i25.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.lazySingleton<_i37.SystemRepository>(
        () => _i38.SystemRepositoryImpl(gh<_i30.LocalDataSource>()));
    gh.lazySingleton<_i39.UserRepository>(() => _i40.UserRepositoryImpl(
          gh<_i30.LocalDataSource>(),
          gh<_i6.NetworkDataSource>(),
        ));
    gh.factory<_i41.GetAccountUseCase>(
        () => _i41.GetAccountUseCase(gh<_i39.UserRepository>()));
    gh.factory<_i42.GetMembersUseCase>(
        () => _i42.GetMembersUseCase(gh<_i32.MemberRepository>()));
    gh.lazySingleton<_i43.GetUserById>(
        () => _i43.GetUserById(gh<_i39.UserRepository>()));
    gh.lazySingleton<_i44.HomeBloc>(
        () => _i44.HomeBloc(gh<_i35.PaginateSiteUseCase>()));
    gh.lazySingleton<_i45.LoginUseCase>(
        () => _i45.LoginUseCase(gh<_i39.UserRepository>()));
    gh.factory<_i46.OnSiteBloc>(
        () => _i46.OnSiteBloc(gh<_i35.PaginateSiteUseCase>()));
    gh.lazySingleton<_i47.ResetPasswordUseCase>(
        () => _i47.ResetPasswordUseCase(gh<_i39.UserRepository>()));
    gh.lazySingleton<_i48.SaveLanguage>(
        () => _i48.SaveLanguage(gh<_i37.SystemRepository>()));
    gh.factory<_i49.UpdateAvatarUseCase>(
        () => _i49.UpdateAvatarUseCase(gh<_i39.UserRepository>()));
    gh.factory<_i50.AccountBloc>(
        () => _i50.AccountBloc(gh<_i41.GetAccountUseCase>()));
    gh.lazySingleton<_i51.AuthBloc>(() => _i51.AuthBloc(
          gh<_i31.Logout>(),
          gh<_i45.LoginUseCase>(),
          gh<_i41.GetAccountUseCase>(),
          gh<_i49.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i52.CreateSiteBloc>(() => _i52.CreateSiteBloc(
          gh<_i42.GetMembersUseCase>(),
          gh<_i28.GetStaticDataUseCase>(),
          gh<_i27.GetPrefecturesUseCase>(),
          gh<_i26.GetCitiesUseCase>(),
          gh<_i29.GetTownsUseCase>(),
        ));
    gh.factory<_i53.ResetPasswordBloc>(
        () => _i53.ResetPasswordBloc(gh<_i47.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i54.RegisterModule {}
