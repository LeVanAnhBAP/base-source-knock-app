

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/unread_count_response.dart';
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart';

@injectable
class GetUnreadCountUseCase extends UseCase<UnreadCount, NoParams?>{
  final NotifyRepository _repository;
  GetUnreadCountUseCase(this._repository);
  @override
  Future<UnreadCount> call([NoParams? params]) {
    return _repository.getUnreadCount();
  }

}