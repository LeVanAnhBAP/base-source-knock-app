// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i20;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.dart'
    as _i27;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.impl.dart'
    as _i28;
import 'package:uq_system_app/data/repositories/chat/chat.repository.dart'
    as _i32;
import 'package:uq_system_app/data/repositories/chat/chat.repository.impl.dart'
    as _i33;
import 'package:uq_system_app/data/repositories/file/file.repository.dart'
    as _i35;
import 'package:uq_system_app/data/repositories/file/file.repository.impl.dart'
    as _i36;
import 'package:uq_system_app/data/repositories/member/member.repository.dart'
    as _i51;
import 'package:uq_system_app/data/repositories/member/member.repository.impl.dart'
    as _i52;
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart'
    as _i11;
import 'package:uq_system_app/data/repositories/notify/notify.repository.impl.dart'
    as _i12;
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart'
    as _i16;
import 'package:uq_system_app/data/repositories/partner/partner.repository.impl.dart'
    as _i17;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i21;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i22;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart'
    as _i23;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.impl.dart'
    as _i24;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i60;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i61;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i62;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i63;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i3;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i29;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i30;
import 'package:uq_system_app/data/sources/local/local.dart' as _i49;
import 'package:uq_system_app/data/sources/network/network.dart' as _i10;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i71;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i50;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i73;
import 'package:uq_system_app/data/usecases/chat/get_deal_rooms_usecase.dart'
    as _i39;
import 'package:uq_system_app/data/usecases/file/get_images_from_upload_usecase.dart'
    as _i40;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i69;
import 'package:uq_system_app/data/usecases/nofity/get_notifications_usecase.dart'
    as _i41;
import 'package:uq_system_app/data/usecases/nofity/get_notify_usecase.dart'
    as _i42;
import 'package:uq_system_app/data/usecases/nofity/get_unread_count_usecase.dart'
    as _i48;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i31;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i54;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i74;
import 'package:uq_system_app/data/usecases/site/create_site_usecase.dart'
    as _i34;
import 'package:uq_system_app/data/usecases/site/get_cities_usecase.dart'
    as _i37;
import 'package:uq_system_app/data/usecases/site/get_companies_nearby_usecase.dart'
    as _i38;
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart'
    as _i68;
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart'
    as _i43;
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart'
    as _i44;
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart'
    as _i45;
import 'package:uq_system_app/data/usecases/site/get_tax_rate_usecase.dart'
    as _i46;
import 'package:uq_system_app/data/usecases/site/get_towns_usecase.dart'
    as _i47;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i55;
import 'package:uq_system_app/data/usecases/site/remove_site_usecase.dart'
    as _i56;
import 'package:uq_system_app/data/usecases/site/update_site_usecase.dart'
    as _i25;
import 'package:uq_system_app/data/usecases/site/upload_images_usecase.dart'
    as _i26;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i67;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i75;
import 'package:uq_system_app/di/register_module.dart' as _i80;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i77;
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_bloc.dart'
    as _i59;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i79;
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_bloc.dart'
    as _i5;
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_bloc.dart'
    as _i65;
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_bloc.dart'
    as _i6;
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart'
    as _i78;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i76;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i4;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i70;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i72;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i57;
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_bloc.dart'
    as _i66;
import 'package:uq_system_app/presentation/pages/invoice/invoice_bloc.dart'
    as _i8;
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_bloc.dart'
    as _i9;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i53;
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart'
    as _i13;
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart'
    as _i14;
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart'
    as _i15;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i18;
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart'
    as _i19;
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart'
    as _i58;
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart'
    as _i64;

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
    gh.factory<_i6.ContractInformationBloc>(
        () => _i6.ContractInformationBloc());
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.factory<_i8.InvoiceBloc>(() => _i8.InvoiceBloc());
    gh.factory<_i9.MemberInvitationBloc>(() => _i9.MemberInvitationBloc());
    gh.lazySingleton<_i10.NetworkDataSource>(
        () => registerModule.registerNetworkDataSource(gh<_i3.ApiServices>()));
    gh.lazySingleton<_i11.NotifyRepository>(
        () => _i12.NotifyRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.factory<_i13.OccupationBloc>(() => _i13.OccupationBloc());
    gh.factory<_i14.OrderDetailsBloc>(() => _i14.OrderDetailsBloc());
    gh.factory<_i15.OrderLineBloc>(() => _i15.OrderLineBloc());
    gh.lazySingleton<_i16.PartnerRepository>(
        () => _i17.PartnerRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.factory<_i18.ScheduleDetailsBloc>(() => _i18.ScheduleDetailsBloc());
    gh.factory<_i19.SearchMemberBloc>(() => _i19.SearchMemberBloc());
    await gh.lazySingletonAsync<_i20.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i21.SiteRepository>(
        () => _i22.SiteRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.lazySingleton<_i23.StaticDataRepository>(
        () => _i24.StaticDataRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.factory<_i25.UpdateSiteUseCase>(
        () => _i25.UpdateSiteUseCase(gh<_i21.SiteRepository>()));
    gh.factory<_i26.UploadImagesUseCase>(
        () => _i26.UploadImagesUseCase(gh<_i21.SiteRepository>()));
    gh.lazySingleton<_i27.AddressInfoRepository>(
        () => _i28.AddressInfoRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.lazySingleton<_i29.AuthServices>(() => _i30.AuthServicesImpl(
          gh<_i7.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i31.ChangeFavoritePartnerStateUseCase>(() =>
        _i31.ChangeFavoritePartnerStateUseCase(gh<_i16.PartnerRepository>()));
    gh.lazySingleton<_i32.ChatRepository>(
        () => _i33.ChatRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.factory<_i34.CreateSiteUseCase>(
        () => _i34.CreateSiteUseCase(gh<_i21.SiteRepository>()));
    gh.lazySingleton<_i35.FileRepository>(
        () => _i36.FileRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.factory<_i37.GetCitiesUseCase>(
        () => _i37.GetCitiesUseCase(gh<_i27.AddressInfoRepository>()));
    gh.factory<_i38.GetCompaniesNearbyUseCase>(
        () => _i38.GetCompaniesNearbyUseCase(gh<_i21.SiteRepository>()));
    gh.factory<_i39.GetDealRoomsUseCase>(
        () => _i39.GetDealRoomsUseCase(gh<_i32.ChatRepository>()));
    gh.factory<_i40.GetImagesFromUploadUseCase>(
        () => _i40.GetImagesFromUploadUseCase(gh<_i35.FileRepository>()));
    gh.factory<_i41.GetNotificationsUseCase>(
        () => _i41.GetNotificationsUseCase(gh<_i11.NotifyRepository>()));
    gh.factory<_i42.GetNotifyUseCase>(
        () => _i42.GetNotifyUseCase(gh<_i11.NotifyRepository>()));
    gh.factory<_i43.GetPrefecturesUseCase>(
        () => _i43.GetPrefecturesUseCase(gh<_i27.AddressInfoRepository>()));
    gh.factory<_i44.GetSiteDetailsUseCase>(
        () => _i44.GetSiteDetailsUseCase(gh<_i21.SiteRepository>()));
    gh.factory<_i45.GetStaticDataUseCase>(
        () => _i45.GetStaticDataUseCase(gh<_i23.StaticDataRepository>()));
    gh.factory<_i46.GetTaxRateUseCase>(
        () => _i46.GetTaxRateUseCase(gh<_i21.SiteRepository>()));
    gh.factory<_i47.GetTownsUseCase>(
        () => _i47.GetTownsUseCase(gh<_i27.AddressInfoRepository>()));
    gh.factory<_i48.GetUnreadCountUseCase>(
        () => _i48.GetUnreadCountUseCase(gh<_i11.NotifyRepository>()));
    gh.lazySingleton<_i49.LocalDataSource>(() => _i49.LocalDataSource(
          gh<_i20.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i50.Logout>(() => _i50.Logout(gh<_i29.AuthServices>()));
    gh.lazySingleton<_i51.MemberRepository>(
        () => _i52.MemberRepositoryImpl(gh<_i10.NetworkDataSource>()));
    gh.factory<_i53.NotificationBloc>(
        () => _i53.NotificationBloc(gh<_i41.GetNotificationsUseCase>()));
    gh.lazySingleton<_i54.PaginatePartnerUseCase>(
        () => _i54.PaginatePartnerUseCase(gh<_i16.PartnerRepository>()));
    gh.lazySingleton<_i55.PaginateSiteUseCase>(
        () => _i55.PaginateSiteUseCase(gh<_i21.SiteRepository>()));
    gh.factory<_i56.RemoveSiteUseCase>(
        () => _i56.RemoveSiteUseCase(gh<_i21.SiteRepository>()));
    gh.lazySingleton<_i57.SearchBloc>(() => _i57.SearchBloc(
          gh<_i54.PaginatePartnerUseCase>(),
          gh<_i31.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.factory<_i58.SiteDetailsBloc>(() => _i58.SiteDetailsBloc(
          gh<_i44.GetSiteDetailsUseCase>(),
          gh<_i56.RemoveSiteUseCase>(),
        ));
    gh.lazySingleton<_i59.SystemNotifyBloc>(
        () => _i59.SystemNotifyBloc(gh<_i42.GetNotifyUseCase>()));
    gh.lazySingleton<_i60.SystemRepository>(
        () => _i61.SystemRepositoryImpl(gh<_i49.LocalDataSource>()));
    gh.lazySingleton<_i62.UserRepository>(() => _i63.UserRepositoryImpl(
          gh<_i49.LocalDataSource>(),
          gh<_i10.NetworkDataSource>(),
        ));
    gh.factory<_i64.WorkerMapBloc>(() => _i64.WorkerMapBloc(
          gh<_i44.GetSiteDetailsUseCase>(),
          gh<_i38.GetCompaniesNearbyUseCase>(),
        ));
    gh.factory<_i65.CompletionReportBloc>(
        () => _i65.CompletionReportBloc(gh<_i40.GetImagesFromUploadUseCase>()));
    gh.factory<_i66.DealRoomBloc>(
        () => _i66.DealRoomBloc(gh<_i39.GetDealRoomsUseCase>()));
    gh.factory<_i67.GetAccountUseCase>(
        () => _i67.GetAccountUseCase(gh<_i62.UserRepository>()));
    gh.factory<_i68.GetMembersUseCase>(
        () => _i68.GetMembersUseCase(gh<_i51.MemberRepository>()));
    gh.lazySingleton<_i69.GetUserById>(
        () => _i69.GetUserById(gh<_i62.UserRepository>()));
    gh.lazySingleton<_i70.HomeBloc>(() => _i70.HomeBloc(
          gh<_i55.PaginateSiteUseCase>(),
          gh<_i48.GetUnreadCountUseCase>(),
        ));
    gh.lazySingleton<_i71.LoginUseCase>(
        () => _i71.LoginUseCase(gh<_i62.UserRepository>()));
    gh.factory<_i72.OnSiteBloc>(
        () => _i72.OnSiteBloc(gh<_i55.PaginateSiteUseCase>()));
    gh.lazySingleton<_i73.ResetPasswordUseCase>(
        () => _i73.ResetPasswordUseCase(gh<_i62.UserRepository>()));
    gh.lazySingleton<_i74.SaveLanguage>(
        () => _i74.SaveLanguage(gh<_i60.SystemRepository>()));
    gh.factory<_i75.UpdateAvatarUseCase>(
        () => _i75.UpdateAvatarUseCase(gh<_i62.UserRepository>()));
    gh.factory<_i76.AccountBloc>(
        () => _i76.AccountBloc(gh<_i67.GetAccountUseCase>()));
    gh.lazySingleton<_i77.AuthBloc>(() => _i77.AuthBloc(
          gh<_i50.Logout>(),
          gh<_i71.LoginUseCase>(),
          gh<_i67.GetAccountUseCase>(),
          gh<_i75.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i78.CreateSiteBloc>(() => _i78.CreateSiteBloc(
          gh<_i44.GetSiteDetailsUseCase>(),
          gh<_i68.GetMembersUseCase>(),
          gh<_i45.GetStaticDataUseCase>(),
          gh<_i43.GetPrefecturesUseCase>(),
          gh<_i37.GetCitiesUseCase>(),
          gh<_i47.GetTownsUseCase>(),
          gh<_i46.GetTaxRateUseCase>(),
          gh<_i26.UploadImagesUseCase>(),
          gh<_i34.CreateSiteUseCase>(),
          gh<_i25.UpdateSiteUseCase>(),
        ));
    gh.factory<_i79.ResetPasswordBloc>(
        () => _i79.ResetPasswordBloc(gh<_i73.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i80.RegisterModule {}
