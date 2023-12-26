import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/on_site/on_site_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class DashBoardOnSitePage extends StatefulWidget {
  @override
  State<DashBoardOnSitePage> createState() => _DashBoardOnSitePageState();
}

class _DashBoardOnSitePageState extends State<DashBoardOnSitePage> {
  // TODO: Register the bloc in the provider
  final OnSiteBloc _bloc = getIt.get<OnSiteBloc>();

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
          title: const Text('On Site Page'),
        ),
        body: const Center(
          child: Text('On Site Page'),
        ),
      ),
    );
  }
}
