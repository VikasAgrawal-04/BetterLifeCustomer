import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widgets/widgets.dart';

part 'view_appointment_state.dart';

class ViewAppointmentCubit extends Cubit<ViewAppointmentState> {
  ViewAppointmentCubit(this.appointment, this.api, this.type)
      : super(
          ViewAppointmentState(
            appointment: appointment,
            status: Status.loading,
            diets: const [],
            notes: const [],
            tests: const [],
          ),
        ) {
    init();
  }
  final ApiRepo api;
  final Appointment appointment;
  final AppointmentType type;

  Future<void> init() async {
    fetchAppointmentDetails();
    fetchDiets();
    fetchNotes();
    fetchTests();
  }

  /// A description for yourCustomFunction
  FutureOr<void> fetchAppointmentDetails() async {
    final result = await api.viewAppointment(
      appointmentId: appointment.apptid!,
      type: type,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            appointment: data,
            status: Status.success,
          ),
        );
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
  }

  FutureOr<void> fetchDiets() async {
    final result = await api.viewDiets(
      appointmentId: appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            diets: data,
          ),
        );
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
  }

  FutureOr<void> fetchNotes() async {
    final result = await api.viewNotes(
      appointmentId: appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            notes: data,
          ),
        );
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
  }

  FutureOr<void> fetchTests() async {
    final result = await api.viewTests(
      appointmentId: appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            tests: data,
          ),
        );
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
  }

  Future<void> reschedule(RescheduleAppointmentParams prams) async {
    final resutl = await api.rescheduleAppointment(params: prams);
    resutl.when(
      success: (data) => DialogService.success(data, onTap: () => Get.close(2)),
      failure: DialogService.failure,
    );
  }
}
