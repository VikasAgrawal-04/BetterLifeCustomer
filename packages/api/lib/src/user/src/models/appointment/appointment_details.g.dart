// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDetails _$AppointmentDetailsFromJson(Map<String, dynamic> json) =>
    AppointmentDetails(
      appointmentId: json['appointmentId'] as int,
      patientName: json['patientName'] as String,
      patientGender: json['patientGender'] as String,
      realationship: json['realationship'] as String,
      patientMobile: json['patientMobile'] as String,
      caretakerGender: json['caretakerGender'] as String,
      caretakerLanguage: json['caretakerLanguage'] as String,
      taxiNeeded: const BoolConverter().fromJson(json['taxiNeeded']),
      acTaxi: const BoolConverter().fromJson(json['acTaxi']),
      pickAddress: json['pickAddress'] as String,
      pickPincode: json['pickPincode'] as String,
      hospital: json['hospital'] as String,
      doctor: json['doctor'] as String,
      purpose: json['purpose'] as String,
      caretaker: (json['caretaker'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
    );

Map<String, dynamic> _$AppointmentDetailsToJson(AppointmentDetails instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'patientName': instance.patientName,
      'patientGender': instance.patientGender,
      'realationship': instance.realationship,
      'patientMobile': instance.patientMobile,
      'caretakerGender': instance.caretakerGender,
      'caretakerLanguage': instance.caretakerLanguage,
      'taxiNeeded': const BoolConverter().toJson(instance.taxiNeeded),
      'acTaxi': const BoolConverter().toJson(instance.acTaxi),
      'pickAddress': instance.pickAddress,
      'pickPincode': instance.pickPincode,
      'hospital': instance.hospital,
      'doctor': instance.doctor,
      'purpose': instance.purpose,
      'caretaker': instance.caretaker,
    };
