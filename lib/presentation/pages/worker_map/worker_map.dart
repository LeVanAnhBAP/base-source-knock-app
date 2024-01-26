import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';

@RoutePage()
class WorkerMapPage extends StatefulWidget {
  @override
  State<WorkerMapPage> createState() => _WorkerMapPageState();
}

class _WorkerMapPageState extends State<WorkerMapPage> {
  final WorkerMapBloc _bloc = getIt.get<WorkerMapBloc>();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
          appBarTitle: '現場から探す',
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
          ],
        ),
      ),
    );
  }
}
