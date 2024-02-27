import 'dart:async';
import 'dart:ui' as ui;

import 'package:api/api.dart';
import 'package:api/constants/endpoints.dart';
import 'package:api_client/api_client.dart';
import 'package:better_life_customer/core/cubit_base.dart';
import 'package:better_life_customer/create_appointment/view/create_appointment_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:better_life_customer/view_appointment/view_appointment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgets/widgets.dart';

part 'home_state.dart';

class HomeCubit extends CubitBase<HomeState> {
  HomeCubit(this.api)
      : super(
          const HomeState(
            tabs: ['Todays', 'Past', 'Upcoming'],
            appointments: [],
            currentIndex: 0,
            polylineCoordinates: [],
          ),
        ) {
    init();
  }
  final ApiRepo api;
  Timer? _locationTimer;

  StreamSubscription<List<Appointment>>? _appointmentsSubscription;

  StreamSubscription<ApiResult<List<Appointment>>>?
      _fetchAppointmentSubscription;

  void _appointmentStream() {
    _appointmentsSubscription?.cancel();
    _appointmentsSubscription = appointmentsStream.listen((appointments) {
      emit(
        state.copyWith(
          appointments: appointments,
          status: appointments.isEmpty ? Status.empty : Status.success,
        ),
      );
    });
  }

  Future<void> init() async {
    await fetchAppointment();
    _appointmentStream();
  }

  AppointmentType get currentAppointmentType =>
      AppointmentType.values[state.currentIndex];

  Stream<List<Appointment>> get appointmentsStream => api.getAppointmentStream(
        type: currentAppointmentType,
      );

  Future<void> fetchAppointment() async {
    await _fetchAppointmentSubscription?.cancel();
    if (state.appointments.isEmpty) {
      emit(state.copyWith(status: Status.loading));
    }
    _fetchAppointmentSubscription = api
        .getAppointments(type: currentAppointmentType)
        .asStream()
        .listen(_apiResultHandler);
  }

  void _apiResultHandler(ApiResult<List<Appointment>> event) {
    event.when(
      success: (appointments) {},
      failure: DialogService.failure,
    );
  }

  Future<void> viewAppointment(Appointment appointment) async {
    await Get.to<void>(
      () => ViewAppointmentPage(
        appointment: appointment,
        type: AppointmentType.values[state.currentIndex],
      ),
    );
  }

  void onTabTapped(int value) {
    emit(state.copyWith(currentIndex: value));
    _appointmentStream();
    fetchAppointment();
  }

  Future<void> onCreateAppointmentPressed() async {
    await Get.to<void>(CreateAppointmentPage.new);
  }

  Future<void> refresh() async {
    await fetchAppointment();
  }

  Future<void> stopLocation() async {
    if (_locationTimer != null && _locationTimer!.isActive) {
      _locationTimer!.cancel();
    }
  }

  Future<void> startLocation(int apptId) async {
    await setIcon();
    _locationTimer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      await getLocation(apptId);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> setIcon() async {
    final markerIcon =
        await getBytesFromAsset('assets/caretaker.png', .15.sh.toInt());
    emit(state.copyWith(careIcon: BitmapDescriptor.fromBytes(markerIcon)));
  }

  Future<void> getLocation(int apptId) async {
    final response = await api.getLocation(apptId);
    response.when(
      success: (success) {
        emit(state.copyWith(careLocation: success));
        getPolyPoints();
      },
      failure: (failure) {},
    );
  }

  Future<void> getPolyPoints() async {
    print('@@@@@@@');
    print(state.careLocation?.caretaker1Latitude);
    print(state.careLocation?.caretaker1Longitude);
    print(state.hosLat);
    print(state.hosLong);
    print('##########');
    final polylinePoints = PolylinePoints();
    final result = await polylinePoints.getRouteBetweenCoordinates(
      Endpoints.gKey,
      PointLatLng(
        double.parse(state.careLocation?.caretaker1Latitude ?? '0.0'),
        double.parse(state.careLocation?.caretaker1Longitude ?? '0.0'),
      ),
      PointLatLng(state.hosLat ?? 0.0, state.hosLong ?? 0.0),
    );
    if (result.points.isNotEmpty) {
      print("inside points");
      final lines = <LatLng>[];
      for (final point in result.points) {
        lines.add(LatLng(point.latitude, point.longitude));
      }
      print(';;;;;;;;;;;;');
      print(lines.length);
      print('::::::::::::');

      emit(state.copyWith(polylineCoordinates: lines));
    }
  }

  void emitDestination(double lat, double long) {
    emit(state.copyWith(hosLat: lat, hosLong: long));
  }

  Future<void> endAppt(int? apptId) async {
    final response = await api.endAppt(apptId ?? 0);
    response.when(
      success: (value) {
        DialogService.success(
          value['message'].toString(),
          onTap: () async {
            await init();
            Get.back<void>();
          },
        );
      },
      failure: (error) {
        DialogService.error(NetworkExceptions.getErrorMessage(error));
      },
    );
  }
}
