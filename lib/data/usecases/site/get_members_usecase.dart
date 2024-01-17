
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/member_response.dart';
import 'package:uq_system_app/data/repositories/member/member.repository.dart';

@injectable
class GetMembersUseCase extends UseCase<List<MemberResponse>, NoParams?>{
  final MemberRepository _memberRepository;
  GetMembersUseCase(this._memberRepository);
  @override
  Future<List<MemberResponse>> call([NoParams? params]) {
    return _memberRepository.getMembers();
  }

}