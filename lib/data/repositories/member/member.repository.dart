
import 'package:uq_system_app/domain/entities/member.dart';


abstract class MemberRepository{
  Future<List<Member>> getMembers();
}