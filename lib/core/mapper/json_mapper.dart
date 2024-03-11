
import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeMapper  implements JsonConverter<DateTime, String>{
  const DateTimeMapper();
  @override
  DateTime fromJson(String json) {
   return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return DateFormat("yyyy/MM/dd")
        .format(object);
  }
  
}