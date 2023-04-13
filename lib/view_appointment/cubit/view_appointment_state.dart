// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'view_appointment_cubit.dart';

/// {@template view_appointment}
/// ViewAppointmentState description
/// {@endtemplate}
class ViewAppointmentState extends Equatable {
  /// {@macro view_appointment}
  final Appointment appointment;
  final Status status;
  final List<String> diets;
  final List<String> notes;
  final List<String> tests;

  const ViewAppointmentState({
    required this.appointment,
    required this.status,
    required this.diets,
    required this.notes,
    required this.tests,
  });

  ViewAppointmentState copyWith({
    Appointment? appointment,
    Status? status,
    List<String>? diets,
    List<String>? notes,
    List<String>? tests,
  }) {
    return ViewAppointmentState(
      appointment: appointment ?? this.appointment,
      status: status ?? this.status,
      diets: diets ?? this.diets,
      notes: notes ?? this.notes,
      tests: tests ?? this.tests,
    );
  }

  @override
  List<Object> get props {
    return [
      appointment,
      status,
      diets,
      notes,
      tests,
    ];
  }
}

/// The initial state of ViewAppointmentState
/// {@endtemplate}
