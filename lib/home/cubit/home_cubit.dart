import 'dart:async';

import 'package:api/api.dart';
import 'package:api_client/api_client.dart';
import 'package:better_life_customer/core/cubit_base.dart';
import 'package:better_life_customer/create_appointment/view/create_appointment_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:better_life_customer/view_appointment/view_appointment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'home_state.dart';

class HomeCubit extends CubitBase<HomeState> {
  HomeCubit(this.api)
      : super(
          const HomeState(
            tabs: ['Todays', 'Past', 'Upcoming'],
            appointments: [],
            currentIndex: 0,
          ),
        ) {
    init();
  }
  final ApiRepo api;

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

  Future<void> getLocation(int apptId) async {
    final response = await api.getLocation(apptId);
    response.when(
      success: (success) {
        debugPrint('Get Location Value$success');
      },
      failure: (failure) {},
    );
  }

  Future<void> endAppt(int apptId) async {
    final response = await api.endAppt(apptId);
    response.when(
      success: (value) {
        DialogService.success(
          value['message'].toString(),
          onTap: () async {},
        );
      },
      failure: (error) {
        DialogService.error(NetworkExceptions.getErrorMessage(error));
      },
    );
  }
}
