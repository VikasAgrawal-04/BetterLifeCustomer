// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_appointment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareAppointmentDetails _$CareAppointmentDetailsFromJson(
        Map<String, dynamic> json) =>
    CareAppointmentDetails(
      status: json['status'] as bool,
      data: CareData.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CareAppointmentDetailsToJson(
        CareAppointmentDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };
