


import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_count_response.freezed.dart';
part 'unread_count_response.g.dart';
@freezed
class UnreadCount with _$UnreadCount{
  const factory UnreadCount({
    @JsonKey(name: 'unread-count') required int count,
  }) = _UnreadCount;

  factory UnreadCount.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountFromJson(json);
}