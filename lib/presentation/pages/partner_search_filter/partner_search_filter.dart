import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/partner_search_filter/partner_search_filter_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class PartnerSearchFilterPage extends StatefulWidget {
  @override
  State<PartnerSearchFilterPage> createState() => _PartnerSearchFilterPageState();
}

class _PartnerSearchFilterPageState extends State<PartnerSearchFilterPage> {
  final PartnerSearchFilterBloc _bloc = getIt.get<PartnerSearchFilterBloc>();

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
          title: const Text('Partner Search Filter Page'),
        ),
        body: const Center(
          child: Text('Partner Search Filter Page'),
        ),
      ),
    );
  }
}
