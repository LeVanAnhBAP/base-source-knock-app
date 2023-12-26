import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/profile/profile_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class DashBoardProfilePage extends StatefulWidget {
  @override
  State<DashBoardProfilePage> createState() => _DashBoardProfilePageState();
}

class _DashBoardProfilePageState extends State<DashBoardProfilePage> {
  // TODO: Register the bloc in the provider
  final ProfileBloc _bloc = getIt.get<ProfileBloc>();

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
          title: const Text('Profile Page'),
        ),
        body: const Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
