import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/notification_response.dart';

part 'completion_report_state.freezed.dart';

enum CompletionReportStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class CompletionReportState with _$CompletionReportState {
  const factory CompletionReportState({
    @Default([]) List<String> imageUrls,
    NotificationResponse? notification,
    @Default(CompletionReportStatus.initial) CompletionReportStatus status,
    BaseException? error,
  }) = _CompletionReportState;
}
