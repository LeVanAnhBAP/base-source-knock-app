import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/contractor_information/contractor_information_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class ContractorInformationPage extends StatefulWidget {
  @override
  State<ContractorInformationPage> createState() => _ContractorInformationPageState();
}

class _ContractorInformationPageState extends State<ContractorInformationPage> {
  final ContractorInformationBloc _bloc = getIt.get<ContractorInformationBloc>();

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
          title: const Text('Contractor Information Page'),
        ),
        body: const Center(
          child: Text('Contractor Information Page'),
        ),
      ),
    );
  }
}
