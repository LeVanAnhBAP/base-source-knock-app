import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/prefecture_response.dart';
import 'package:uq_system_app/data/repositories/prefecture/prefecture.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as: PrefectureRepository)
class PrefectureRepositoryImpl implements PrefectureRepository {
  final NetworkDataSource _dataSource;

  const PrefectureRepositoryImpl(this._dataSource);

  @override
  Future<List<PrefectureResponse>> getPrefectures() async {
    var result = await _dataSource.getPrefectures();
    return result.data!;
  }
}
