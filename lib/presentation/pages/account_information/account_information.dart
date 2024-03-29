import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/account_information/account_information_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class AccountInformationPage extends StatefulWidget {
  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  final AccountInformationBloc _bloc = getIt.get<AccountInformationBloc>();

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
          titleText: 'アカウント情報',
        ),
        body: const Center(
          child: Text('Account Information Page'),
        ),
      ),
    );
  }
}
