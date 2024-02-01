import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';

part 'completion_report_event.freezed.dart';

@freezed
class CompletionReportEvent with _$CompletionReportEvent {
  const factory CompletionReportEvent.errorOccurred([BaseException? error]) = CompletionReportErrorOccurred;
  const factory CompletionReportEvent.loadImages({required List<String> filePaths}) = CompletionReportLoadImages;
}
