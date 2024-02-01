import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/request/upload_multi_params.dart';
import 'package:uq_system_app/data/usecases/file/get_images_from_upload_usecase.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_event.dart';
import 'package:uq_system_app/presentation/pages/completion_report/completion_report_state.dart';

@injectable
class CompletionReportBloc extends Bloc<CompletionReportEvent, CompletionReportState> {
  final GetImagesFromUploadUseCase _getImagesFromUploadUseCase;
  CompletionReportBloc(this._getImagesFromUploadUseCase) : super(const CompletionReportState()) {
    on<CompletionReportErrorOccurred>(_onErrorOccurred);
    on<CompletionReportLoadImages>(_onLoadImages);
  }
  FutureOr<void> _onLoadImages(
      CompletionReportLoadImages event,
      Emitter<CompletionReportState> emit,
      ) async{
    emit(state.copyWith(status: CompletionReportStatus.loading));

    var result = await _getImagesFromUploadUseCase(UploadMultiParams(filePaths: event.filePaths));
    emit(state.copyWith(
      status: CompletionReportStatus.success,
      imageUrls: result
    ));
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CompletionReportErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    CompletionReportErrorOccurred event,
    Emitter<CompletionReportState> emit,
  ) {
    emit(state.copyWith(
      status: CompletionReportStatus.failure,
    ));
  }
}
