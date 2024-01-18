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
    on<SearchMemberReceiveData>(_onReceiveData);
    on<SearchMemberSearch>(_onSearch);
    on<SearchMemberChangeSelection>(_onChangeSelection);
  }
  FutureOr<void> _onChangeSelection(SearchMemberChangeSelection event,Emitter<SearchMemberState> emit) async{
    emit(state.copyWith(status: SearchMemberStatus.loading));
    var newMembers = state.members
        .map((e) => e.id == event.memberId ? e.copyWith(isSelected: !e.isSelected) : e)
        .toList();
    emit(state.copyWith(status: SearchMemberStatus.success, members:  newMembers));
  }
  FutureOr<void> _onSearch(SearchMemberSearch event,Emitter<SearchMemberState> emit) async{
    emit(state.copyWith(status: SearchMemberStatus.loading));
    var result = state.members
        .where((element) =>
    (element.firstName ?? '').toLowerCase().contains(event.searchText) ||
        (element.lastName ?? '').toLowerCase().contains(event.searchText))
        .toList();
    emit(state.copyWith(status: SearchMemberStatus.success, members: result));
  }
  FutureOr<void> _onReceiveData(SearchMemberReceiveData event,Emitter<SearchMemberState> emit) async{
    emit(state.copyWith(status: SearchMemberStatus.success, members: event.members));
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
