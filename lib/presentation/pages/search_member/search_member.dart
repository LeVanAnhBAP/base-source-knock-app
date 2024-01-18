import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/search_member/search_member_bloc.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';


@RoutePage()
class SearchMemberPage extends StatefulWidget {
  @override
  State<SearchMemberPage> createState() => _SearchMemberPageState();
}

class _SearchMemberPageState extends State<SearchMemberPage> {
  final SearchMemberBloc _bloc = getIt.get<SearchMemberBloc>();

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
        appBar: CustomAppBar(
          context,
          appBarTitle: '職種',

        ),
        body: const Center(
          child: Text('Search Member Page'),
        ),
      ),
    );
  }
}
