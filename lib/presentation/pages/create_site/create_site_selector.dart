import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_bloc.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_state.dart';

import '../../../domain/entities/member.dart';

class CreateSiteStatusSelector
    extends BlocSelector<CreateSiteBloc, CreateSiteState, CreateSiteStatus> {
  CreateSiteStatusSelector({
    required Widget Function(CreateSiteStatus data) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (_, status) => builder(status),
        );
}
class ListMemberSelector
    extends BlocSelector<CreateSiteBloc, CreateSiteState, List<Member>> {
  ListMemberSelector({
    required Widget Function(List<Member> data) builder,
  }) : super(
    selector: (state) => state.members,

    builder: (_, data) => builder(data),
  );
}

class ListMemberBuilder
extends BlocBuilder<CreateSiteBloc, CreateSiteState>{
  ListMemberBuilder(
  {
    required Widget Function(CreateSiteState state) builder,
}
      ) : super(
    builder : (_,state) => builder(state)
  );

}



class CreateSiteStatusListener extends BlocListener<CreateSiteBloc, CreateSiteState> {
  CreateSiteStatusListener({
    required Iterable<CreateSiteStatus> statuses,
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previousState, currentState) =>
              previousState.status != currentState.status && statuses.contains(currentState.status),
        );
}
