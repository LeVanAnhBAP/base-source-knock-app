
import '../../models/response/address_info_response.dart';

abstract class AddressInfoRepository{
  Future<List<AddressInfoResponse>> getPrefectures();
  Future<List<AddressInfoResponse>> getCities(int prefectureId);
  Future<List<AddressInfoResponse>> getTowns(int cityId);
}