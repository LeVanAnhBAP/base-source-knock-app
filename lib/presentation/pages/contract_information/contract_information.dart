import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/contract_information/contract_information_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class ContractInformationPage extends StatefulWidget {
  @override
  State<ContractInformationPage> createState() => _ContractInformationPageState();
}

class _ContractInformationPageState extends State<ContractInformationPage> {
  final ContractInformationBloc _bloc = getIt.get<ContractInformationBloc>();

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
          title: const Text('Contract Information Page'),
        ),
        body: const Center(
          child: Text('Contract Information Page'),
        ),
      ),
    );
  }
}
