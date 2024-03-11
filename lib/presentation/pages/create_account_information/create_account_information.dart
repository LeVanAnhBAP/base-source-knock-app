import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/create_account_information/create_account_information_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class CreateAccountInformationPage extends StatefulWidget {
  @override
  State<CreateAccountInformationPage> createState() => _CreateAccountInformationPageState();
}

class _CreateAccountInformationPageState extends State<CreateAccountInformationPage> {
  final CreateAccountInformationBloc _bloc = getIt.get<CreateAccountInformationBloc>();

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
          title: const Text('Create Account Information Page'),
        ),
        body: const Center(
          child: Text('Create Account Information Page'),
        ),
      ),
    );
  }
}
