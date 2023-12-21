
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';
@freezed
class Schedule with _$Schedule{
  const factory Schedule({
    required int  id,
    required String title,
    required String address,
    required String startTime,
    required String endTime,
    required String company,
  }) = _Schedule;

    factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}