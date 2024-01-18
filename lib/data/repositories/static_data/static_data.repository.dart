
import 'package:uq_system_app/data/models/response/static_data_response.dart';

abstract class StaticDataRepository{
  Future<StaticDataResponse> getStaticData();
}