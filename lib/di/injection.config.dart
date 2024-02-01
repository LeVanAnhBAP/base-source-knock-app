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
import 'package:shared_preferences/shared_preferences.dart' as _i17;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.dart'
    as _i24;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.impl.dart'
    as _i25;
import 'package:uq_system_app/data/repositories/chat/chat.repository.dart'
    as _i29;
import 'package:uq_system_app/data/repositories/chat/chat.repository.impl.dart'
    as _i30;
import 'package:uq_system_app/data/repositories/file/file.repository.dart'
    as _i32;
import 'package:uq_system_app/data/repositories/file/file.repository.impl.dart'
    as _i33;
import 'package:uq_system_app/data/repositories/member/member.repository.dart'
    as _i48;
import 'package:uq_system_app/data/repositories/member/member.repository.impl.dart'
    as _i49;
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart'
    as _i8;
import 'package:uq_system_app/data/repositories/notify/notify.repository.impl.dart'
    as _i9;
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/partner/partner.repository.impl.dart'
    as _i14;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i18;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i19;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart'
    as _i20;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.impl.dart'
    as _i21;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i57;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i58;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i59;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i60;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i3;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i26;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i27;
import 'package:uq_system_app/data/sources/local/local.dart' as _i46;
import 'package:uq_system_app/data/sources/network/network.dart' as _i7;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i68;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i47;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i70;
import 'package:uq_system_app/data/usecases/chat/get_deal_rooms_usecase.dart'
    as _i36;
import 'package:uq_system_app/data/usecases/file/get_images_from_upload_usecase.dart'
    as _i37;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i66;
import 'package:uq_system_app/data/usecases/nofity/get_notifications_usecase.dart'
    as _i38;
import 'package:uq_system_app/data/usecases/nofity/get_notify_usecase.dart'
    as _i39;
import 'package:uq_system_app/data/usecases/nofity/get_unread_count_usecase.dart'
    as _i45;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i28;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i51;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i71;
import 'package:uq_system_app/data/usecases/site/create_site_usecase.dart'
    as _i31;
import 'package:uq_system_app/data/usecases/site/get_cities_usecase.dart'
    as _i34;
import 'package:uq_system_app/data/usecases/site/get_companies_nearby_usecase.dart'
    as _i35;
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart'
    as _i65;
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart'
    as _i40;
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart'
    as _i41;
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart'
    as _i42;
import 'package:uq_system_app/data/usecases/site/get_tax_rate_usecase.dart'
    as _i43;
import 'package:uq_system_app/data/usecases/site/get_towns_usecase.dart'
    as _i44;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i52;
import 'package:uq_system_app/data/usecases/site/remove_site_usecase.dart'
    as _i53;
import 'package:uq_system_app/data/usecases/site/update_site_usecase.dart'
    as _i22;
import 'package:uq_system_app/data/usecases/site/upload_images_usecase.dart'
    as _i23;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i64;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i72;
import 'package:uq_system_app/di/register_module.dart' as _i77;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i74;
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_bloc.dart'
    as _i56;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i76;
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_bloc.dart'
    as _i5;
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_bloc.dart'
    as _i62;
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart'
    as _i75;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i73;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i4;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i67;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i69;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i54;
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_bloc.dart'
    as _i63;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i50;
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart'
    as _i10;
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart'
    as _i11;
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart'
    as _i12;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i15;
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart'
    as _i16;
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart'
    as _i55;
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart'
    as _i61;

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
    gh.factory<_i5.ChatDealRoomBloc>(() => _i5.ChatDealRoomBloc());
    gh.lazySingleton<_i6.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.lazySingleton<_i7.NetworkDataSource>(
        () => registerModule.registerNetworkDataSource(gh<_i3.ApiServices>()));
    gh.lazySingleton<_i8.NotifyRepository>(
        () => _i9.NotifyRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.factory<_i10.OccupationBloc>(() => _i10.OccupationBloc());
    gh.factory<_i11.OrderDetailsBloc>(() => _i11.OrderDetailsBloc());
    gh.factory<_i12.OrderLineBloc>(() => _i12.OrderLineBloc());
    gh.lazySingleton<_i13.PartnerRepository>(
        () => _i14.PartnerRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.factory<_i15.ScheduleDetailsBloc>(() => _i15.ScheduleDetailsBloc());
    gh.factory<_i16.SearchMemberBloc>(() => _i16.SearchMemberBloc());
    await gh.lazySingletonAsync<_i17.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i18.SiteRepository>(
        () => _i19.SiteRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.lazySingleton<_i20.StaticDataRepository>(
        () => _i21.StaticDataRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.factory<_i22.UpdateSiteUseCase>(
        () => _i22.UpdateSiteUseCase(gh<_i18.SiteRepository>()));
    gh.factory<_i23.UploadImagesUseCase>(
        () => _i23.UploadImagesUseCase(gh<_i18.SiteRepository>()));
    gh.lazySingleton<_i24.AddressInfoRepository>(
        () => _i25.AddressInfoRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.lazySingleton<_i26.AuthServices>(() => _i27.AuthServicesImpl(
          gh<_i6.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i28.ChangeFavoritePartnerStateUseCase>(() =>
        _i28.ChangeFavoritePartnerStateUseCase(gh<_i13.PartnerRepository>()));
    gh.lazySingleton<_i29.ChatRepository>(
        () => _i30.ChatRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.factory<_i31.CreateSiteUseCase>(
        () => _i31.CreateSiteUseCase(gh<_i18.SiteRepository>()));
    gh.lazySingleton<_i32.FileRepository>(
        () => _i33.FileRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.factory<_i34.GetCitiesUseCase>(
        () => _i34.GetCitiesUseCase(gh<_i24.AddressInfoRepository>()));
    gh.factory<_i35.GetCompaniesNearbyUseCase>(
        () => _i35.GetCompaniesNearbyUseCase(gh<_i18.SiteRepository>()));
    gh.factory<_i36.GetDealRoomsUseCase>(
        () => _i36.GetDealRoomsUseCase(gh<_i29.ChatRepository>()));
    gh.factory<_i37.GetImagesFromUploadUseCase>(
        () => _i37.GetImagesFromUploadUseCase(gh<_i32.FileRepository>()));
    gh.factory<_i38.GetNotificationsUseCase>(
        () => _i38.GetNotificationsUseCase(gh<_i8.NotifyRepository>()));
    gh.factory<_i39.GetNotifyUseCase>(
        () => _i39.GetNotifyUseCase(gh<_i8.NotifyRepository>()));
    gh.factory<_i40.GetPrefecturesUseCase>(
        () => _i40.GetPrefecturesUseCase(gh<_i24.AddressInfoRepository>()));
    gh.factory<_i41.GetSiteDetailsUseCase>(
        () => _i41.GetSiteDetailsUseCase(gh<_i18.SiteRepository>()));
    gh.factory<_i42.GetStaticDataUseCase>(
        () => _i42.GetStaticDataUseCase(gh<_i20.StaticDataRepository>()));
    gh.factory<_i43.GetTaxRateUseCase>(
        () => _i43.GetTaxRateUseCase(gh<_i18.SiteRepository>()));
    gh.factory<_i44.GetTownsUseCase>(
        () => _i44.GetTownsUseCase(gh<_i24.AddressInfoRepository>()));
    gh.factory<_i45.GetUnreadCountUseCase>(
        () => _i45.GetUnreadCountUseCase(gh<_i8.NotifyRepository>()));
    gh.lazySingleton<_i46.LocalDataSource>(() => _i46.LocalDataSource(
          gh<_i17.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i47.Logout>(() => _i47.Logout(gh<_i26.AuthServices>()));
    gh.lazySingleton<_i48.MemberRepository>(
        () => _i49.MemberRepositoryImpl(gh<_i7.NetworkDataSource>()));
    gh.factory<_i50.NotificationBloc>(
        () => _i50.NotificationBloc(gh<_i38.GetNotificationsUseCase>()));
    gh.lazySingleton<_i51.PaginatePartnerUseCase>(
        () => _i51.PaginatePartnerUseCase(gh<_i13.PartnerRepository>()));
    gh.lazySingleton<_i52.PaginateSiteUseCase>(
        () => _i52.PaginateSiteUseCase(gh<_i18.SiteRepository>()));
    gh.factory<_i53.RemoveSiteUseCase>(
        () => _i53.RemoveSiteUseCase(gh<_i18.SiteRepository>()));
    gh.lazySingleton<_i54.SearchBloc>(() => _i54.SearchBloc(
          gh<_i51.PaginatePartnerUseCase>(),
          gh<_i28.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.factory<_i55.SiteDetailsBloc>(() => _i55.SiteDetailsBloc(
          gh<_i41.GetSiteDetailsUseCase>(),
          gh<_i53.RemoveSiteUseCase>(),
        ));
    gh.lazySingleton<_i56.SystemNotifyBloc>(
        () => _i56.SystemNotifyBloc(gh<_i39.GetNotifyUseCase>()));
    gh.lazySingleton<_i57.SystemRepository>(
        () => _i58.SystemRepositoryImpl(gh<_i46.LocalDataSource>()));
    gh.lazySingleton<_i59.UserRepository>(() => _i60.UserRepositoryImpl(
          gh<_i46.LocalDataSource>(),
          gh<_i7.NetworkDataSource>(),
        ));
    gh.factory<_i61.WorkerMapBloc>(() => _i61.WorkerMapBloc(
          gh<_i41.GetSiteDetailsUseCase>(),
          gh<_i35.GetCompaniesNearbyUseCase>(),
        ));
    gh.factory<_i62.CompletionReportBloc>(
        () => _i62.CompletionReportBloc(gh<_i37.GetImagesFromUploadUseCase>()));
    gh.factory<_i63.DealRoomBloc>(
        () => _i63.DealRoomBloc(gh<_i36.GetDealRoomsUseCase>()));
    gh.factory<_i64.GetAccountUseCase>(
        () => _i64.GetAccountUseCase(gh<_i59.UserRepository>()));
    gh.factory<_i65.GetMembersUseCase>(
        () => _i65.GetMembersUseCase(gh<_i48.MemberRepository>()));
    gh.lazySingleton<_i66.GetUserById>(
        () => _i66.GetUserById(gh<_i59.UserRepository>()));
    gh.lazySingleton<_i67.HomeBloc>(() => _i67.HomeBloc(
          gh<_i52.PaginateSiteUseCase>(),
          gh<_i45.GetUnreadCountUseCase>(),
        ));
    gh.lazySingleton<_i68.LoginUseCase>(
        () => _i68.LoginUseCase(gh<_i59.UserRepository>()));
    gh.factory<_i69.OnSiteBloc>(
        () => _i69.OnSiteBloc(gh<_i52.PaginateSiteUseCase>()));
    gh.lazySingleton<_i70.ResetPasswordUseCase>(
        () => _i70.ResetPasswordUseCase(gh<_i59.UserRepository>()));
    gh.lazySingleton<_i71.SaveLanguage>(
        () => _i71.SaveLanguage(gh<_i57.SystemRepository>()));
    gh.factory<_i72.UpdateAvatarUseCase>(
        () => _i72.UpdateAvatarUseCase(gh<_i59.UserRepository>()));
    gh.factory<_i73.AccountBloc>(
        () => _i73.AccountBloc(gh<_i64.GetAccountUseCase>()));
    gh.lazySingleton<_i74.AuthBloc>(() => _i74.AuthBloc(
          gh<_i47.Logout>(),
          gh<_i68.LoginUseCase>(),
          gh<_i64.GetAccountUseCase>(),
          gh<_i72.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i75.CreateSiteBloc>(() => _i75.CreateSiteBloc(
          gh<_i41.GetSiteDetailsUseCase>(),
          gh<_i65.GetMembersUseCase>(),
          gh<_i42.GetStaticDataUseCase>(),
          gh<_i40.GetPrefecturesUseCase>(),
          gh<_i34.GetCitiesUseCase>(),
          gh<_i44.GetTownsUseCase>(),
          gh<_i43.GetTaxRateUseCase>(),
          gh<_i23.UploadImagesUseCase>(),
          gh<_i31.CreateSiteUseCase>(),
          gh<_i22.UpdateSiteUseCase>(),
        ));
    gh.factory<_i76.ResetPasswordBloc>(
        () => _i76.ResetPasswordBloc(gh<_i70.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i77.RegisterModule {}
