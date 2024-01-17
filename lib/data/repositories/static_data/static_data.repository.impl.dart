


import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/repositories/static_data/static_data.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as : StaticDataRepository)
class StaticDataRepositoryImpl implements StaticDataRepository{
  final NetworkDataSource _dataSource;
  const StaticDataRepositoryImpl(this._dataSource);
  @override
  Future<StaticDataResponse> getStaticData() async{
    var result = await _dataSource.getStaticData();
    return result.data!;
  }

}