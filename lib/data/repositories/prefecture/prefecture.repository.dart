
import '../../models/response/prefecture_response.dart';

abstract class PrefectureRepository{
  Future<List<PrefectureResponse>> getPrefectures();
}