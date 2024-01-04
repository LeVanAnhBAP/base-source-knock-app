
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/paginate_site_params.dart';
import 'package:uq_system_app/data/models/response/site_response.dart';
import 'package:uq_system_app/data/repositories/site/site.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as: SiteRepository)
class SiteRepositoryImpl extends SiteRepository {
  final NetworkDataSource _networkDataSource;
  SiteRepositoryImpl(this._networkDataSource);
  @override
  Future<List<SiteResponse>> paginateSite(PaginateSiteParams request) async {
    var result = await _networkDataSource.paginateSite(
        request.page, request.startDayRequest);
    return result.data.data;
  }
}
