import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/onsite_information_room/onsite_information_room_bloc.dart';

// TODO: Add the page to the router
@RoutePage()
class OnsiteInformationRoomPage extends StatefulWidget {
  @override
  State<OnsiteInformationRoomPage> createState() => _OnsiteInformationRoomPageState();
}

class _OnsiteInformationRoomPageState extends State<OnsiteInformationRoomPage> {
  final OnsiteInformationRoomBloc _bloc = getIt.get<OnsiteInformationRoomBloc>();

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
          title: const Text('Onsite Information Room Page'),
        ),
        body: const Center(
          child: Text('Onsite Information Room Page'),
        ),
      ),
    );
  }
}
