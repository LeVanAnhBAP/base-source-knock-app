import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_state.dart';

class SearchMemberStatusSelector
    extends BlocSelector<SearchMemberBloc, SearchMemberState, SearchMemberStatus> {
  SearchMemberStatusSelector({
    required Widget Function(SearchMemberStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}

class SearchMemberStatusListener extends BlocListener<SearchMemberBloc, SearchMemberState> {
  SearchMemberStatusListener({
    required Iterable<SearchMemberStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
