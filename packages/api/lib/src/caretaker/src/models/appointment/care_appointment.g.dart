// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareAppointment _$CareAppointmentFromJson(Map<String, dynamic> json) =>
    CareAppointment(
      apptid: json['apptid'] as int?,
      visitdate: json['visitdate'] as String?,
      pickuptime: json['pickuptime'] as String?,
      patientname: json['patientname'] as String?,
      hospital: json['hospital'] as String?,
      pickaddress: json['pickaddress'] as String?,
      rating: json['rating'] as int?,
      viewDetials: json['viewDetials'] as bool? ?? false,
    );

Map<String, dynamic> _$CareAppointmentToJson(CareAppointment instance) =>
    <String, dynamic>{
      'apptid': instance.apptid,
      'visitdate': instance.visitdate,
      'pickuptime': instance.pickuptime,
      'patientname': instance.patientname,
      'hospital': instance.hospital,
      'pickaddress': instance.pickaddress,
      'rating': instance.rating,
      'viewDetials': instance.viewDetials,
    };
