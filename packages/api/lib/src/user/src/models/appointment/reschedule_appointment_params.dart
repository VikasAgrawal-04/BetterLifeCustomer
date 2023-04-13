// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_format/date_format.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reschedule_appointment_params.g.dart';

@JsonSerializable()
class RescheduleAppointmentParams {
  final int appointmentId;

  @JsonKey(toJson: _dateToJson)
  final DateTime appointmentDate;

  @JsonKey(toJson: _timeToJson)
  final DateTime appointmentTime;

  RescheduleAppointmentParams({
    required this.appointmentId,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory RescheduleAppointmentParams.fromJson(Map<String, dynamic> json) =>
      _$RescheduleAppointmentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RescheduleAppointmentParamsToJson(this);

  static String _dateToJson(DateTime date) =>
      MyDateFormat.formatDateYYYYMMDD(date);
  static String _timeToJson(DateTime date) => MyDateFormat.formatTimeHHMM(date);
}
