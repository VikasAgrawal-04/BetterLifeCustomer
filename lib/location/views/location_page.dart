import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets/my_loading_indicator.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({
    required this.apptId,
    required this.hospitalLat,
    required this.hospitalLong,
    super.key,
  });
  final int apptId;
  final String hospitalLat;
  final String hospitalLong;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(context.read<ApiRepo>())..startLocation(apptId),
      lazy: false,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: context.theme.primaryColor,
        body: LocationView(
          hospitalLat: double.parse(hospitalLat),
          hospitalLong: double.parse(hospitalLong),
        ),
      ),
    );
  }
}

class LocationView extends StatefulWidget {
  const LocationView({
    required this.hospitalLat,
    required this.hospitalLong,
    super.key,
  });
  final double hospitalLat;
  final double hospitalLong;

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapsControl;

  @override
  void dispose() {
    mapsControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) async {
        final cubit = BlocProvider.of<HomeCubit>(context);
        await cubit.stopLocation();
        return;
      },
      child: Scaffold(
        appBar: const MyAppBar(
          title: Text('Better-Life'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            context
                .read<HomeCubit>()
                .emitDestination(widget.hospitalLat, widget.hospitalLong);
            if (state.polylineCoordinates.isEmpty) {
              return const MyLoadingIndicator();
            } else {
              return GoogleMap(
                onMapCreated: (controller) {
                  _controller.complete(controller);
                  mapsControl = controller;
                },
                polylines: <Polyline>{
                  Polyline(
                    polylineId: const PolylineId('polyId'),
                    points: state.polylineCoordinates,
                    width: 3,
                  ),
                },
                markers: <Marker>{
                  Marker(
                    icon: state.careIcon,
                    markerId: const MarkerId('Source'),
                    position: LatLng(
                      double.parse(state.careLocation!.caretaker1Latitude),
                      double.parse(
                        state.careLocation!.caretaker1Longitude,
                      ),
                    ),
                  ),
                  Marker(
                    markerId: const MarkerId('Destination'),
                    position: LatLng(
                      widget.hospitalLat,
                      widget.hospitalLong,
                    ),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    double.parse(state.careLocation!.caretaker1Latitude),
                    double.parse(
                      state.careLocation!.caretaker1Longitude,
                    ),
                  ),
                  zoom: 15,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
