// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i21;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.dart'
    as _i28;
import 'package:uq_system_app/data/repositories/address_info/address_info.repository.impl.dart'
    as _i29;
import 'package:uq_system_app/data/repositories/chat/chat.repository.dart'
    as _i33;
import 'package:uq_system_app/data/repositories/chat/chat.repository.impl.dart'
    as _i34;
import 'package:uq_system_app/data/repositories/file/file.repository.dart'
    as _i36;
import 'package:uq_system_app/data/repositories/file/file.repository.impl.dart'
    as _i37;
import 'package:uq_system_app/data/repositories/member/member.repository.dart'
    as _i52;
import 'package:uq_system_app/data/repositories/member/member.repository.impl.dart'
    as _i53;
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart'
    as _i12;
import 'package:uq_system_app/data/repositories/notify/notify.repository.impl.dart'
    as _i13;
import 'package:uq_system_app/data/repositories/partner/partner.repository.dart'
    as _i17;
import 'package:uq_system_app/data/repositories/partner/partner.repository.impl.dart'
    as _i18;
import 'package:uq_system_app/data/repositories/site/site.repository.dart'
    as _i22;
import 'package:uq_system_app/data/repositories/site/site.repository.impl.dart'
    as _i23;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart'
    as _i24;
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.impl.dart'
    as _i25;
import 'package:uq_system_app/data/repositories/system/system.repository.dart'
    as _i61;
import 'package:uq_system_app/data/repositories/system/system.repository.impl.dart'
    as _i62;
import 'package:uq_system_app/data/repositories/user/user.repository.dart'
    as _i63;
import 'package:uq_system_app/data/repositories/user/user.repository.impl.dart'
    as _i64;
import 'package:uq_system_app/data/services/api/api.service.dart' as _i4;
import 'package:uq_system_app/data/services/auth/auth.services.dart' as _i30;
import 'package:uq_system_app/data/services/auth/auth.services.impl.dart'
    as _i31;
import 'package:uq_system_app/data/sources/local/local.dart' as _i50;
import 'package:uq_system_app/data/sources/network/network.dart' as _i11;
import 'package:uq_system_app/data/usecases/auth/login_usecase.dart' as _i72;
import 'package:uq_system_app/data/usecases/auth/logout.dart' as _i51;
import 'package:uq_system_app/data/usecases/auth/resetpassword_usecase.dart'
    as _i74;
import 'package:uq_system_app/data/usecases/chat/get_deal_rooms_usecase.dart'
    as _i40;
import 'package:uq_system_app/data/usecases/file/get_images_from_upload_usecase.dart'
    as _i41;
import 'package:uq_system_app/data/usecases/get_user_by_id.dart' as _i70;
import 'package:uq_system_app/data/usecases/nofity/get_notifications_usecase.dart'
    as _i42;
import 'package:uq_system_app/data/usecases/nofity/get_notify_usecase.dart'
    as _i43;
import 'package:uq_system_app/data/usecases/nofity/get_unread_count_usecase.dart'
    as _i49;
import 'package:uq_system_app/data/usecases/partner/change_favorite_partner_state_usecase.dart'
    as _i32;
import 'package:uq_system_app/data/usecases/partner/paginate_partner_usecase.dart'
    as _i55;
import 'package:uq_system_app/data/usecases/save_language.dart' as _i75;
import 'package:uq_system_app/data/usecases/site/create_site_usecase.dart'
    as _i35;
import 'package:uq_system_app/data/usecases/site/get_cities_usecase.dart'
    as _i38;
import 'package:uq_system_app/data/usecases/site/get_companies_nearby_usecase.dart'
    as _i39;
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart'
    as _i69;
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart'
    as _i44;
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart'
    as _i45;
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart'
    as _i46;
import 'package:uq_system_app/data/usecases/site/get_tax_rate_usecase.dart'
    as _i47;
import 'package:uq_system_app/data/usecases/site/get_towns_usecase.dart'
    as _i48;
import 'package:uq_system_app/data/usecases/site/paginate_site_usecase.dart'
    as _i56;
import 'package:uq_system_app/data/usecases/site/remove_site_usecase.dart'
    as _i57;
import 'package:uq_system_app/data/usecases/site/update_site_usecase.dart'
    as _i26;
import 'package:uq_system_app/data/usecases/site/upload_images_usecase.dart'
    as _i27;
import 'package:uq_system_app/data/usecases/user/get_account_usecase.dart'
    as _i68;
import 'package:uq_system_app/data/usecases/user/update_avatar_usecase.dart'
    as _i76;
import 'package:uq_system_app/di/register_module.dart' as _i81;
import 'package:uq_system_app/presentation/blocs/auth/auth_bloc.dart' as _i78;
import 'package:uq_system_app/presentation/blocs/system_notify/system_notify_bloc.dart'
    as _i60;
import 'package:uq_system_app/presentation/pages/account_information/account_information_bloc.dart'
    as _i3;
import 'package:uq_system_app/presentation/pages/auth/reset_password/reset_password_bloc.dart'
    as _i80;
import 'package:uq_system_app/presentation/pages/chat_deal_room/chat_deal_room_bloc.dart'
    as _i6;
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_bloc.dart'
    as _i66;
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_bloc.dart'
    as _i7;
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart'
    as _i79;
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart'
    as _i77;
import 'package:uq_system_app/presentation/pages/dashboard/chat/chat_bloc.dart'
    as _i5;
import 'package:uq_system_app/presentation/pages/dashboard/home/home_bloc.dart'
    as _i71;
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart'
    as _i73;
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart'
    as _i58;
import 'package:uq_system_app/presentation/pages/deal_room/deal_room_bloc.dart'
    as _i67;
import 'package:uq_system_app/presentation/pages/invoice/invoice_bloc.dart'
    as _i9;
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_bloc.dart'
    as _i10;
import 'package:uq_system_app/presentation/pages/notification/notification_bloc.dart'
    as _i54;
import 'package:uq_system_app/presentation/pages/occupation/occupation_bloc.dart'
    as _i14;
import 'package:uq_system_app/presentation/pages/order_details/order_details_bloc.dart'
    as _i15;
import 'package:uq_system_app/presentation/pages/order_line/order_line_bloc.dart'
    as _i16;
import 'package:uq_system_app/presentation/pages/schedule_details/schedule_details_bloc.dart'
    as _i19;
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart'
    as _i20;
import 'package:uq_system_app/presentation/pages/site_details/site_details_bloc.dart'
    as _i59;
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart'
    as _i65;

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
    gh.factory<_i3.AccountInformationBloc>(() => _i3.AccountInformationBloc());
    gh.lazySingleton<_i4.ApiServices>(
        () => registerModule.registerApiService());
    gh.factory<_i5.ChatBloc>(() => _i5.ChatBloc());
    gh.factory<_i6.ChatDealRoomBloc>(() => _i6.ChatDealRoomBloc());
    gh.factory<_i7.ContractInformationBloc>(
        () => _i7.ContractInformationBloc());
    gh.lazySingleton<_i8.FlutterSecureStorage>(
        () => registerModule.getFlutterSecureStorage);
    gh.factory<_i9.InvoiceBloc>(() => _i9.InvoiceBloc());
    gh.factory<_i10.MemberInvitationBloc>(() => _i10.MemberInvitationBloc());
    gh.lazySingleton<_i11.NetworkDataSource>(
        () => registerModule.registerNetworkDataSource(gh<_i4.ApiServices>()));
    gh.lazySingleton<_i12.NotifyRepository>(
        () => _i13.NotifyRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.factory<_i14.OccupationBloc>(() => _i14.OccupationBloc());
    gh.factory<_i15.OrderDetailsBloc>(() => _i15.OrderDetailsBloc());
    gh.factory<_i16.OrderLineBloc>(() => _i16.OrderLineBloc());
    gh.lazySingleton<_i17.PartnerRepository>(
        () => _i18.PartnerRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.factory<_i19.ScheduleDetailsBloc>(() => _i19.ScheduleDetailsBloc());
    gh.factory<_i20.SearchMemberBloc>(() => _i20.SearchMemberBloc());
    await gh.lazySingletonAsync<_i21.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i22.SiteRepository>(
        () => _i23.SiteRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.lazySingleton<_i24.StaticDataRepository>(
        () => _i25.StaticDataRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.lazySingleton<String>(
      () => registerModule.registerKey(),
      instanceName: 'key',
    );
    gh.factory<_i26.UpdateSiteUseCase>(
        () => _i26.UpdateSiteUseCase(gh<_i22.SiteRepository>()));
    gh.factory<_i27.UploadImagesUseCase>(
        () => _i27.UploadImagesUseCase(gh<_i22.SiteRepository>()));
    gh.lazySingleton<_i28.AddressInfoRepository>(
        () => _i29.AddressInfoRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.lazySingleton<_i30.AuthServices>(() => _i31.AuthServicesImpl(
          gh<_i8.FlutterSecureStorage>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.factory<_i32.ChangeFavoritePartnerStateUseCase>(() =>
        _i32.ChangeFavoritePartnerStateUseCase(gh<_i17.PartnerRepository>()));
    gh.lazySingleton<_i33.ChatRepository>(
        () => _i34.ChatRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.factory<_i35.CreateSiteUseCase>(
        () => _i35.CreateSiteUseCase(gh<_i22.SiteRepository>()));
    gh.lazySingleton<_i36.FileRepository>(
        () => _i37.FileRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.factory<_i38.GetCitiesUseCase>(
        () => _i38.GetCitiesUseCase(gh<_i28.AddressInfoRepository>()));
    gh.factory<_i39.GetCompaniesNearbyUseCase>(
        () => _i39.GetCompaniesNearbyUseCase(gh<_i22.SiteRepository>()));
    gh.factory<_i40.GetDealRoomsUseCase>(
        () => _i40.GetDealRoomsUseCase(gh<_i33.ChatRepository>()));
    gh.factory<_i41.GetImagesFromUploadUseCase>(
        () => _i41.GetImagesFromUploadUseCase(gh<_i36.FileRepository>()));
    gh.factory<_i42.GetNotificationsUseCase>(
        () => _i42.GetNotificationsUseCase(gh<_i12.NotifyRepository>()));
    gh.factory<_i43.GetNotifyUseCase>(
        () => _i43.GetNotifyUseCase(gh<_i12.NotifyRepository>()));
    gh.factory<_i44.GetPrefecturesUseCase>(
        () => _i44.GetPrefecturesUseCase(gh<_i28.AddressInfoRepository>()));
    gh.factory<_i45.GetSiteDetailsUseCase>(
        () => _i45.GetSiteDetailsUseCase(gh<_i22.SiteRepository>()));
    gh.factory<_i46.GetStaticDataUseCase>(
        () => _i46.GetStaticDataUseCase(gh<_i24.StaticDataRepository>()));
    gh.factory<_i47.GetTaxRateUseCase>(
        () => _i47.GetTaxRateUseCase(gh<_i22.SiteRepository>()));
    gh.factory<_i48.GetTownsUseCase>(
        () => _i48.GetTownsUseCase(gh<_i28.AddressInfoRepository>()));
    gh.factory<_i49.GetUnreadCountUseCase>(
        () => _i49.GetUnreadCountUseCase(gh<_i12.NotifyRepository>()));
    gh.lazySingleton<_i50.LocalDataSource>(() => _i50.LocalDataSource(
          gh<_i21.SharedPreferences>(),
          gh<String>(instanceName: 'key'),
        ));
    gh.lazySingleton<_i51.Logout>(() => _i51.Logout(gh<_i30.AuthServices>()));
    gh.lazySingleton<_i52.MemberRepository>(
        () => _i53.MemberRepositoryImpl(gh<_i11.NetworkDataSource>()));
    gh.factory<_i54.NotificationBloc>(
        () => _i54.NotificationBloc(gh<_i42.GetNotificationsUseCase>()));
    gh.lazySingleton<_i55.PaginatePartnerUseCase>(
        () => _i55.PaginatePartnerUseCase(gh<_i17.PartnerRepository>()));
    gh.lazySingleton<_i56.PaginateSiteUseCase>(
        () => _i56.PaginateSiteUseCase(gh<_i22.SiteRepository>()));
    gh.factory<_i57.RemoveSiteUseCase>(
        () => _i57.RemoveSiteUseCase(gh<_i22.SiteRepository>()));
    gh.lazySingleton<_i58.SearchBloc>(() => _i58.SearchBloc(
          gh<_i55.PaginatePartnerUseCase>(),
          gh<_i32.ChangeFavoritePartnerStateUseCase>(),
        ));
    gh.factory<_i59.SiteDetailsBloc>(() => _i59.SiteDetailsBloc(
          gh<_i45.GetSiteDetailsUseCase>(),
          gh<_i57.RemoveSiteUseCase>(),
        ));
    gh.lazySingleton<_i60.SystemNotifyBloc>(
        () => _i60.SystemNotifyBloc(gh<_i43.GetNotifyUseCase>()));
    gh.lazySingleton<_i61.SystemRepository>(
        () => _i62.SystemRepositoryImpl(gh<_i50.LocalDataSource>()));
    gh.lazySingleton<_i63.UserRepository>(() => _i64.UserRepositoryImpl(
          gh<_i50.LocalDataSource>(),
          gh<_i11.NetworkDataSource>(),
        ));
    gh.factory<_i65.WorkerMapBloc>(() => _i65.WorkerMapBloc(
          gh<_i45.GetSiteDetailsUseCase>(),
          gh<_i39.GetCompaniesNearbyUseCase>(),
        ));
    gh.factory<_i66.CompletionReportBloc>(
        () => _i66.CompletionReportBloc(gh<_i41.GetImagesFromUploadUseCase>()));
    gh.factory<_i67.DealRoomBloc>(
        () => _i67.DealRoomBloc(gh<_i40.GetDealRoomsUseCase>()));
    gh.factory<_i68.GetAccountUseCase>(
        () => _i68.GetAccountUseCase(gh<_i63.UserRepository>()));
    gh.factory<_i69.GetMembersUseCase>(
        () => _i69.GetMembersUseCase(gh<_i52.MemberRepository>()));
    gh.lazySingleton<_i70.GetUserById>(
        () => _i70.GetUserById(gh<_i63.UserRepository>()));
    gh.lazySingleton<_i71.HomeBloc>(() => _i71.HomeBloc(
          gh<_i56.PaginateSiteUseCase>(),
          gh<_i49.GetUnreadCountUseCase>(),
        ));
    gh.lazySingleton<_i72.LoginUseCase>(
        () => _i72.LoginUseCase(gh<_i63.UserRepository>()));
    gh.factory<_i73.OnSiteBloc>(
        () => _i73.OnSiteBloc(gh<_i56.PaginateSiteUseCase>()));
    gh.lazySingleton<_i74.ResetPasswordUseCase>(
        () => _i74.ResetPasswordUseCase(gh<_i63.UserRepository>()));
    gh.lazySingleton<_i75.SaveLanguage>(
        () => _i75.SaveLanguage(gh<_i61.SystemRepository>()));
    gh.factory<_i76.UpdateAvatarUseCase>(
        () => _i76.UpdateAvatarUseCase(gh<_i63.UserRepository>()));
    gh.factory<_i77.AccountBloc>(
        () => _i77.AccountBloc(gh<_i68.GetAccountUseCase>()));
    gh.lazySingleton<_i78.AuthBloc>(() => _i78.AuthBloc(
          gh<_i51.Logout>(),
          gh<_i72.LoginUseCase>(),
          gh<_i68.GetAccountUseCase>(),
          gh<_i76.UpdateAvatarUseCase>(),
        ));
    gh.factory<_i79.CreateSiteBloc>(() => _i79.CreateSiteBloc(
          gh<_i45.GetSiteDetailsUseCase>(),
          gh<_i69.GetMembersUseCase>(),
          gh<_i46.GetStaticDataUseCase>(),
          gh<_i44.GetPrefecturesUseCase>(),
          gh<_i38.GetCitiesUseCase>(),
          gh<_i48.GetTownsUseCase>(),
          gh<_i47.GetTaxRateUseCase>(),
          gh<_i27.UploadImagesUseCase>(),
          gh<_i35.CreateSiteUseCase>(),
          gh<_i26.UpdateSiteUseCase>(),
        ));
    gh.factory<_i80.ResetPasswordBloc>(
        () => _i80.ResetPasswordBloc(gh<_i74.ResetPasswordUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i81.RegisterModule {}
