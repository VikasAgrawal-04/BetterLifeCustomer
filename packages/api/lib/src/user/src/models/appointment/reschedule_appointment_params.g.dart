// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_appointment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescheduleAppointmentParams _$RescheduleAppointmentParamsFromJson(
        Map<String, dynamic> json) =>
    RescheduleAppointmentParams(
      appointmentId: json['appointmentId'] as int,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      appointmentTime: DateTime.parse(json['appointmentTime'] as String),
    );

Map<String, dynamic> _$RescheduleAppointmentParamsToJson(
        RescheduleAppointmentParams instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'appointmentDate':
          RescheduleAppointmentParams._dateToJson(instance.appointmentDate),
      'appointmentTime':
          RescheduleAppointmentParams._timeToJson(instance.appointmentTime),
    };
