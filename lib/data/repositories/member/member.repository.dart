
import '../../models/response/member_response.dart';

abstract class MemberRepository{
  Future<List<MemberResponse>> getMembers();
}