
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/bases/usecases/base_use_case.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart';

@injectable
class GetNotificationsUseCase extends UseCase<List<NotificationResponse>, int>{
  final NotifyRepository _repository;
  GetNotificationsUseCase(this._repository);
  @override
  Future<List<NotificationResponse>> call(int params) {
    return _repository.getNotifications(params);
  }

}
