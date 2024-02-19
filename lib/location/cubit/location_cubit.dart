import 'package:better_life_customer/location/cubit/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as p;
import 'package:widgets/widgets.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState.initial()) {
    init();
  }

  Future<void> init() async {
    final permission = await checkLocationPermission();
    if (permission) {
      await startLocationListener();
    }
  }

  Future<bool> checkLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permission;

    serviceEnabled = await state.location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await state.location.requestService();
      if (!serviceEnabled) {
        const GetSnackBar(
          message: 'Location services are disabled. Please enable the services',
        ).show();
        await state.location.requestService();
      }
    }
    permission = await state.location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await state.location.requestPermission();
      if (permission == PermissionStatus.denied) {
        const GetSnackBar(message: 'Location permissions are Needed').show();
        permission = await state.location.requestPermission();
        if (permission == PermissionStatus.denied) return false;
      }
    }
    if (permission == PermissionStatus.deniedForever) {
      const GetSnackBar(message: 'Location permissions are Needed').show();
      await Future<void>.delayed(const Duration(seconds: 1));
      await p.openAppSettings();
      return false;
    }
    return true;
  }

  Future<void> startLocationListener() async {
    await state.location.enableBackgroundMode();
    state.location.onLocationChanged.listen((LocationData data) {
      print('Current Location ${data.toString()}');
      emit(state.copyWith(currentPosition: data));
    });
  }

  LocationData get curPos => state.currentPosition;
}
