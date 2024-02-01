

import 'package:injectable/injectable.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';
import 'package:uq_system_app/data/models/response/unread_count_response.dart';
import 'package:uq_system_app/data/models/response/unread_response.dart';
import 'package:uq_system_app/data/repositories/notify/notify.repository.dart';
import 'package:uq_system_app/data/sources/network/network.dart';

@LazySingleton(as : NotifyRepository)
class NotifyRepositoryImpl extends NotifyRepository{
  final NetworkDataSource _networkDataSource;
  NotifyRepositoryImpl(this._networkDataSource);
  @override
  Future<UnreadResponse> getNotify() async{
    var result  = await _networkDataSource.getNotify();
    return result.data!;
  }

  @override
  Future<UnreadCount> getUnreadCount() async{
    var result  = await _networkDataSource.getUnreadCount();
    return result.data!;
  }

  @override
  Future<List<NotificationResponse>> getNotifications(int page) async{
    var result = await _networkDataSource.getNotifications(page);
    return result.data!.data;
  }

}