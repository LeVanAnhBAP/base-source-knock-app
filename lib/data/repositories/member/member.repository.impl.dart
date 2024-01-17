

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/repositories/member/member.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';
@LazySingleton(as : MemberRepository)
class MemberRepositoryImpl implements MemberRepository{
  final NetworkDataSource _dataSource;
  MemberRepositoryImpl(this._dataSource);
  @override
  Future<List<MemberResponse>> getMembers() async{
    var result = await _dataSource.getMembers();
    return result.data!;
  }

}