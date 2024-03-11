

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/unread_response.dart';
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart';

@injectable
class GetNotifyUseCase extends UseCase<UnreadResponse, NoParams?>{
  final NotifyRepository _repository;
  GetNotifyUseCase(this._repository);
  @override
  Future<UnreadResponse> call([NoParams? params]) {
    return _repository.getNotify();
  }

}