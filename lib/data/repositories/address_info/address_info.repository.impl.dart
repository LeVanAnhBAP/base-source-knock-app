import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/address_info_response.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

import 'address_info.repository.dart';

@LazySingleton(as: AddressInfoRepository)
class AddressInfoRepositoryImpl implements AddressInfoRepository {
  final NetworkDataSource _dataSource;

  const AddressInfoRepositoryImpl(this._dataSource);

  @override
  Future<List<AddressInfoResponse>> getPrefectures() async {
    var result = await _dataSource.getPrefectures();
    return result.data!;
  }

  @override
  Future<List<AddressInfoResponse>> getCities(int prefectureId) async {
    var result = await _dataSource.getCities(prefectureId);
    return result.data!;
  }

  @override
  Future<List<AddressInfoResponse>> getTowns(int cityId) async{
    var result = await _dataSource.getTowns(cityId);
    return result.data!;
  }
}
