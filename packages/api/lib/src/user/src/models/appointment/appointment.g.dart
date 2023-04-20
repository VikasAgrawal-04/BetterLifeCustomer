// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponseModel _$AppointmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppointmentResponseModelToJson(
        AppointmentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      apptid: json['apptid'] as int?,
      visitdate: json['visitdate'] as String?,
      pickuptime: json['pickuptime'] as String?,
      pickaddress: json['pickaddress'] as String?,
      hospital: json['hospital'] as String?,
      caretakerid: json['caretakerid'] as int?,
      doctor: json['doctor'] as String?,
      taxineeded: Appointment._boolFromJson(json['taxineeded']),
      caretakers: (json['caretakers'] as List<dynamic>?)
          ?.map((e) => Caretaker.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..otp = json['otp'] as String?;

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'apptid': instance.apptid,
      'visitdate': instance.visitdate,
      'pickuptime': instance.pickuptime,
      'pickaddress': instance.pickaddress,
      'hospital': instance.hospital,
      'caretakerid': instance.caretakerid,
      'doctor': instance.doctor,
      'otp': instance.otp,
      'taxineeded': instance.taxineeded,
      'caretakers': instance.caretakers,
    };
