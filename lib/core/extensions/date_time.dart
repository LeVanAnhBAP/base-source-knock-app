import 'dart:core';

extension DateTimeExtension on DateTime {
  bool isBeforeNow(String dateString){
    DateTime dateTimeFromStr = DateTime.parse(dateString);
    return isAfter(dateTimeFromStr);
  }
}
