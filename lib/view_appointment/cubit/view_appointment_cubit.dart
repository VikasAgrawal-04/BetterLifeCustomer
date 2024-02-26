import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widgets/widgets.dart';

part 'view_appointment_state.dart';

class ViewAppointmentCubit extends Cubit<ViewAppointmentState> {
  ViewAppointmentCubit(Appointment appointment, this.api, AppointmentType type)
      : super(
          ViewAppointmentState(
            type: type,
            appointment: appointment,
            status: Status.loading,
            diets: const [],
            notes: const [],
            tests: const [],
            prescriptions: const [],
          ),
        ) {
    init();
  }
  final ApiRepo api;

  Future<void> init() async {
    await fetchAppointmentDetails();
  }

  /// A description for yourCustomFunction
  FutureOr<void> fetchAppointmentDetails() async {
    final result = await api.viewAppointment(
      appointmentId: state.appointment.apptid!,
      type: state.type,
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

  Future<List<String>> fetchDiets() async {
    final list = <String>[];
    final result = await api.viewDiets(
      appointmentId: state.appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            diets: data,
          ),
        );
        return list.addAll(data);
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
    return list;
  }

  Future<List<String>> fetchNotes() async {
    final list = <String>[];
    final result = await api.viewNotes(
      appointmentId: state.appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(state.copyWith(notes: data));
        return list.addAll(data);
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
    return list;
  }

  Future<List<String>> fetchTests() async {
    final list = <String>[];

    final result = await api.viewTests(
      appointmentId: state.appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            tests: data,
          ),
        );
        return list.addAll(data);
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
    return list;
  }

  Future<List<String>> fetchPresciptions() async {
    final list = <String>[];
    final result = await api.viewPrescriptions(
      appointmentId: state.appointment.apptid!,
    );
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            prescriptions: data,
          ),
        );
        return list.addAll(data);
      },
      failure: (e) {
        emit(state.copyWith(status: Status.error));
        DialogService.failure(e);
      },
    );
    return list;
  }

  Future<void> reschedule(RescheduleAppointmentParams prams) async {
    final resutl = await api.rescheduleAppointment(params: prams);
    resutl.when(
      success: (data) => DialogService.success(data, onTap: () => Get.close(2)),
      failure: DialogService.failure,
    );
  }

  Future<void> cancel() async {
    final resutl =
        await api.cancelAppointment(appointmendId: state.appointment.apptid!);
    resutl.when(
      success: (data) => DialogService.success(
        data,
        onTap: () async {
          await api.getAppointments(type: AppointmentType.future);
          Get.close(2);
        },
      ),
      failure: DialogService.failure,
    );
  }
}
