import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_bloc.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_state.dart';

class CompletionReportSelector<T>
    extends BlocSelector<CompletionReportBloc, CompletionReportState, T> {
  CompletionReportSelector({
    required Widget Function(T data) builder,
    required super.selector
  }) : super(
          builder: (_, data) => builder(data),
        );
}

class CompletionReportStatusListener extends BlocListener<CompletionReportBloc, CompletionReportState> {
  CompletionReportStatusListener({
    required Iterable<CompletionReportStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
