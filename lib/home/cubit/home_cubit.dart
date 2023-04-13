import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/core/cubit_base.dart';
import 'package:better_life_customer/create_appointment/view/create_appointment_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:better_life_customer/view_appointment/view_appointment.dart';
import 'package:equatable/equatable.dart';
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

  Future<void> init() async {
    await fetchUser();
  }

  Future<void> fetchUser() async {
    emit(state.copyWith(status: Status.loading));
    final result = await api.getAppointments(
      type: AppointmentType.values[state.currentIndex],
    );
    result.when(
      success: (appointments) {
        emit(
          state.copyWith(
            appointments: appointments,
            status: appointments.isEmpty ? Status.empty : Status.success,
          ),
        );
      },
      failure: (error) {
        DialogService.failure(error);
      },
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
  }

  Future<void> onCreateAppointmentPressed() async {
    await Get.to<void>(CreateAppointmentPage.new);
  }
}
