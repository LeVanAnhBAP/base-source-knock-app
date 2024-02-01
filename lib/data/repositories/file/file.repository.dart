

import 'package:uq_system_app/data/models/request/upload_multi_params.dart';

abstract class FileRepository{
  Future<List<String>> getImagesFromUpload(UploadMultiParams request);
}