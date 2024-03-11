import 'dart:core';


extension DateTimeExtension on DateTime {
  String formatTimeDifference(){
    Duration difference = DateTime.now().difference(this);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}時間前';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}日前';
    } else if (difference.inDays < 28) {
      return '${(difference.inDays / 7).floor()}週間前';
    } else {
      return "$year年$month月$day日 $hour時間$minute分";
    }
  }
}
