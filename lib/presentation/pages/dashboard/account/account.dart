import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/dashboard/account/account_bloc.dart';
import 'package:uq_system_app/presentation/widgets/dashboard_app_bar.dart';

@RoutePage()
class DashboardAccountPage extends StatefulWidget {
  @override
  State<DashboardAccountPage> createState() => _DashboardAccountPageState();
}

class _DashboardAccountPageState extends State<DashboardAccountPage> {
  final AccountBloc _bloc = getIt.get<AccountBloc>();

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
          title: DashBoardAppBar(
            title: context.tr(LocaleKeys.Dashboard_Profile),
          ),
        ),
        body: Column(
          children: [SizedBox(height: 300, child: Stack(
            children: [
              // Image.network(src);
            ],
          ))],
        ),
      ),
    );
  }
}
