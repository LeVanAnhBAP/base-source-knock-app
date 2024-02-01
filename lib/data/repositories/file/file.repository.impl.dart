

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/request/upload_multi_params.dart';
import 'package:uq_system_app/data/repositories/file/file.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as : FileRepository)
class FileRepositoryImpl extends FileRepository{
  final NetworkDataSource _networkDataSource;
  FileRepositoryImpl(this._networkDataSource);
  @override
  Future<List<String>> getImagesFromUpload(UploadMultiParams request) async{
    var result = await _networkDataSource.getImagesFromUpload(request);
    return result.data!;
  }

}