import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_event.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_state.dart';

@injectable
class SearchMemberBloc extends Bloc<SearchMemberEvent, SearchMemberState> {
  SearchMemberBloc() : super(const SearchMemberState()) {
    on<SearchMemberErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SearchMemberErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    SearchMemberErrorOccurred event,
    Emitter<SearchMemberState> emit,
  ) {
    emit(state.copyWith(
      status: SearchMemberStatus.failure,
    ));
  }
}
