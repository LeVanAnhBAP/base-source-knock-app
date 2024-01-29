
import 'package:uq_system_app/data/models/response/unread_count_response.dart';
import 'package:uq_system_app/data/models/response/unread_response.dart';

abstract class NotifyRepository{
  Future<UnreadResponse> getNotify();
  Future<UnreadCount> getUnreadCount();
}