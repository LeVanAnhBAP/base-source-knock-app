import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/search/search_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class DashBoardSearchPage extends StatefulWidget {
  @override
  State<DashBoardSearchPage> createState() => _DashBoardSearchPageState();
}

class _DashBoardSearchPageState extends State<DashBoardSearchPage> {
  // TODO: Register the bloc in the provider
  final SearchBloc _bloc = getIt.get<SearchBloc>();

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
          title: const Text('Search Page'),
        ),
        body: const Center(
          child: Text('Search Page'),
        ),
      ),
    );
  }
}
