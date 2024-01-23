import 'dart:io';

import 'package:uq_system_app/core/bases/responses/base_response.dart';
import 'package:uq_system_app/core/bases/responses/paginate_response.dart';
import 'package:uq_system_app/data/models/request/favorite_partner_params.dart';
import 'package:uq_system_app/data/models/request/login_params.dart';
import 'package:uq_system_app/data/models/request/static_data_params.dart';
import 'package:uq_system_app/data/models/response/account.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/models/response/partner_response.dart';
import 'package:uq_system_app/data/models/response/address_info_response.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/models/response/login_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/services/api/api.service.dart';
import 'package:uq_system_app/data/sources/network/network_urls.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network.g.dart';

@RestApi()
abstract class NetworkDataSource {
  factory NetworkDataSource(
    ApiServices apiServices, {
    String baseUrl,
  }) = _NetworkDataSource;
  //Auth
  @POST(NetworkUrls.login)
  Future<BaseResponse<LoginResponse>> login(
    @Body() LoginParams params,
  );
  @POST(NetworkUrls.resetPassword)
  Future<HttpResponse> resetPassword(
      @Query('email') String email, @Query('type') String type);
  @POST(NetworkUrls.logout)
  Future<void> logout();

  //Site
  @GET(NetworkUrls.factoryFloor)
  Future<BaseResponse<PaginateResponse<List<SiteResponse>>>> paginateSite(
    @Query('page') int page,
    @Query('start_day_request') String? startDayRequest,
    @Query('name') String? name,
  );

  //Partner
  @GET(NetworkUrls.searchPartner)
  Future<BaseResponse<PaginateResponse<List<PartnerResponse>>>> paginatePartner(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );
  @PUT(NetworkUrls.favoritePartner)
  Future<BaseResponse> changeFavoritePartnerState(@Body() FavoritePartnerParams request);

  //Profile
  @GET(NetworkUrls.info)
  Future<BaseResponse<Account>> getUserInfo();

  @POST(NetworkUrls.updateAvatar)
  @MultiPart()
  Future<BaseResponse> updateAvatar(
  @Part(name: 'avatar') File avatar,
      @Part(name: '_method') String method
      );
  //StaticData
  @POST(NetworkUrls.staticData)
  Future<BaseResponse<StaticDataResponse>> getStaticData(
      @Body() StaticDataParams request
      );
  //Member
  @GET(NetworkUrls.member)
  Future<BaseResponse<List<MemberResponse>>> getMembers();
  //Address
  @GET(NetworkUrls.prefecture)
  Future<BaseResponse<List<AddressInfoResponse>>> getPrefectures();
  @GET('${NetworkUrls.city}/{id}')
  Future<BaseResponse<List<AddressInfoResponse>>> getCities(@Path('id') int id);
  @GET('${NetworkUrls.town}/{id}')
  Future<BaseResponse<List<AddressInfoResponse>>> getTowns(@Path('id') int id);
}
