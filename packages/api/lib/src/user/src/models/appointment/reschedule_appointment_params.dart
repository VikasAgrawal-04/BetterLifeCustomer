import 'package:api/converters/date_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reschedule_appointment_params.g.dart';

@JsonSerializable()
class RescheduleAppointmentParams {
  final int appointmentId;

  @DateConverter()
  final DateTime appointmentDate;

  RescheduleAppointmentParams({
    required this.appointmentId,
    required this.appointmentDate,
  });

  factory RescheduleAppointmentParams.fromJson(Map<String, dynamic> json) =>
      _$RescheduleAppointmentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RescheduleAppointmentParamsToJson(this);
}
