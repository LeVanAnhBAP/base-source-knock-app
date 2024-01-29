import 'dart:async';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uq_system_app/assets.gen.dart';
import 'package:uq_system_app/core/extensions/theme.dart';
import 'package:uq_system_app/core/languages/translation_keys.g.dart';
import 'package:uq_system_app/data/models/response/company_response.dart';
import 'package:uq_system_app/di/injection.dart';
import 'package:uq_system_app/helpers/image_processing.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_bloc.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_event.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_selector.dart';
import 'package:uq_system_app/presentation/pages/worker_map/worker_map_state.dart';
import 'package:uq_system_app/presentation/widgets/base_app_bar.dart';

@RoutePage()
class WorkerMapPage extends StatefulWidget {
  final int siteId;

  const WorkerMapPage(this.siteId);

  @override
  State<WorkerMapPage> createState() => _WorkerMapPageState();
}

class _WorkerMapPageState extends State<WorkerMapPage> {
  final WorkerMapBloc _bloc = getIt.get<WorkerMapBloc>();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> companiesNearbyMarkers = {};

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      //TODO: Implement
      _bloc.add(const WorkerMapEvent.loadData(siteId: 1003));
    });
  }

  addCompaniesNearbyMarker(List<CompanyResponse> companies) async {
    for (var company in companies) {
      final Uint8List markerIcon =
          await ImageProcessing.getBytesFromUrl(company.logo?.url ?? "");
      Marker marker = Marker(
          markerId: MarkerId(company.id.toString()),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position: LatLng(double.parse(company.latitude ?? "0.0"),double.parse(company.longitude ?? "0.0")));
      companiesNearbyMarkers.add(marker);
    }
    setState(() {

    });
  }

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
          appBarTitle: context.tr(LocaleKeys.WorkerMap_SearchFromTheSite),
        ),
        body: MultiBlocListener(
          listeners: [
            WorkerMapStatusListener(
              statuses: const [WorkerMapStatus.success],
              listener: (context, state) {
                if (state.companiesNearby.isNotEmpty) {
                  addCompaniesNearbyMarker(state.companiesNearby);
                }
              },
            )
          ],
          child: WorkerMapStatusSelector(builder: (status) {
            if (status == WorkerMapStatus.success) {
              var siteDetails = _bloc.state.siteDetails!;
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(siteDetails.latitude!),
                          double.parse(siteDetails.longitude!)),
                      zoom: 15,
                    ),
                    markers: <Marker>{
                      Marker(
                          markerId: const MarkerId("site_location"),
                          position: LatLng(double.parse(siteDetails.latitude!),
                              double.parse(siteDetails.longitude!))),
                      ...companiesNearbyMarkers,
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: context.colors.secondary,
                            borderRadius: BorderRadius.circular(48)),
                        child: SvgPicture.asset(
                          Assets.icons.svg.icSearchWorker.path,
                          width: 50,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
