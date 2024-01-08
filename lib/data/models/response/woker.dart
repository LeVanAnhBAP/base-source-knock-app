
import 'package:freezed_annotation/freezed_annotation.dart';
part 'woker.freezed.dart';
@freezed
class Worker with _$Worker{
  const factory Worker({
    required String title,
    required String content,
    required String address,
    required String job,
    required int amount,
    required bool isDone,
  }) = _Worker;
}