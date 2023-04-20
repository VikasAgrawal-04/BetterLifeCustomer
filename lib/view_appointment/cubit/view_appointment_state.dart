// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'view_appointment_cubit.dart';

/// {@template view_appointment}
/// ViewAppointmentState description
/// {@endtemplate}
class ViewAppointmentState extends Equatable {
  /// {@macro view_appointment}
  final Appointment appointment;
  final AppointmentType type;
  final Status status;
  final List<String> diets;
  final List<String> notes;
  final List<String> tests;
  final List<String> prescriptions;

  const ViewAppointmentState({
    required this.appointment,
    required this.type,
    required this.status,
    required this.diets,
    required this.notes,
    required this.tests,
    required this.prescriptions,
  });

  ViewAppointmentState copyWith({
    Appointment? appointment,
    AppointmentType? type,
    Status? status,
    List<String>? diets,
    List<String>? notes,
    List<String>? tests,
    List<String>? prescriptions,
  }) {
    return ViewAppointmentState(
      appointment: appointment ?? this.appointment,
      type: type ?? this.type,
      status: status ?? this.status,
      diets: diets ?? this.diets,
      notes: notes ?? this.notes,
      tests: tests ?? this.tests,
      prescriptions: prescriptions ?? this.prescriptions,
    );
  }

  @override
  List<Object> get props {
    return [
      appointment,
      type,
      status,
      diets,
      notes,
      tests,
      prescriptions,
    ];
  }
}

/// The initial state of ViewAppointmentState
/// {@endtemplate}
