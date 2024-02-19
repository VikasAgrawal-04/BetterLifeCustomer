import 'dart:math';

import 'package:api/api.dart';
import 'package:better_life_customer/location/cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:widgets/widgets.dart';

// ignore: must_be_immutable
class PickupDropMaps extends StatefulWidget {
  PickupDropMaps({
    required this.latitude,
    required this.longitude,
    required this.callback,
    super.key,
    this.drop = false,
  });
  
  double longitude;
  double latitude;
  Future<void> Function(AddressCallback data) callback;
  final bool drop;

  @override
  State<PickupDropMaps> createState() => _PickupDropMapsState();
}

class _PickupDropMapsState extends State<PickupDropMaps> {
  final theme = Get.textTheme;
  late GoogleMapController mapsControl;
  late final LocationData position;

  @override
  void initState() {
    super.initState();
    position = BlocProvider.of<LocationCubit>(context).curPos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('New Appointments'),
        onBackPressed: () async {
          Get.back<void>();
        },
      ),
      bottomNavigationBar: MyElevatedButton(
        text: 'Confirm Location',
        onPressed: () async {
          await EasyLoading.show();
          final location = await placemarkFromCoordinates(
            widget.latitude,
            widget.longitude,
          );
          await widget.callback(
            AddressCallback(
              address:
                  '${location.first.name}+${location.first.street}, ${location.first.thoroughfare}, ${location.first.subLocality}, ${location.first.locality}, ${location.first.postalCode}',
              latitude: widget.latitude,
              longitude: widget.longitude,
            ),
          );
          Get
            ..back<void>()
            ..back<void>();
          await EasyLoading.dismiss();
        },
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapsControl = controller;
        },
        myLocationEnabled: !widget.drop,
        myLocationButtonEnabled: !widget.drop,
        markers: <Marker>{
          Marker(
            draggable: true,
            onDragEnd: (value) {
              widget
                ..latitude = value.latitude
                ..longitude = value.longitude;
            },
            markerId: MarkerId(Random().nextInt(1000).toString()),
            position: LatLng(widget.latitude, widget.longitude),
          ),
        },
        initialCameraPosition: CameraPosition(
          target: widget.drop
              ? LatLng(widget.latitude, widget.longitude)
              : LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
          zoom: 18,
        ),
      ),
    );
  }
}
