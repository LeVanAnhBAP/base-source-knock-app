import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/member_invitation/member_invitation_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class MemberInvitationPage extends StatefulWidget {
  @override
  State<MemberInvitationPage> createState() => _MemberInvitationPageState();
}

class _MemberInvitationPageState extends State<MemberInvitationPage> {
  final MemberInvitationBloc _bloc = getIt.get<MemberInvitationBloc>();

  @override
  void dispose() {
    _bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Member Invitation Page'),
        ),
        body: const Center(
          child: Text('Member Invitation Page'),
        ),
      ),
    );
  }
}
