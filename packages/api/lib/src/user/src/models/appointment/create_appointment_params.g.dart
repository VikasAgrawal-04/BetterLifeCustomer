// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentParams _$CreateAppointmentParamsFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentParams(
      patientName: json['patientName'] as String,
      patientGender: json['patientGender'] as String,
      patientRelationship: json['patientRelationship'] as String,
      mobileNumber: json['mobileNumber'] as String,
      noOfCaretakers: json['noOfCaretakers'] as String,
      caretakerGender: json['caretakerGender'] as String,
      caretakerLanguage: json['caretakerLanguage'] as String,
      taxiNeeded: json['taxiNeeded'] == null
          ? false
          : const BoolConverter().fromJson(json['taxiNeeded']),
      acTaxi: json['acTaxi'] == null
          ? false
          : const BoolConverter().fromJson(json['acTaxi']),
      drivetaxi: const BoolConverter().fromJson(json['drivetaxi']),
      visitDate: DateTime.parse(json['visitDate'] as String),
      pickUpAddress: json['pickUpAddress'] as String,
      pickUpPinCode: json['pickUpPinCode'] as String,
      hospital: json['hospital'] as String,
      doctorsName: json['doctorsName'] as String,
      visitPurpose: json['visitPurpose'] as String,
      apptDuration: json['apptDuration'] as String,
      caretaker:
          (json['caretaker'] as List<dynamic>).map((e) => e as int).toList(),
      pickUpLatitude: (json['pickUpLatitude'] as num).toDouble(),
      pickUpLongitude: (json['pickUpLongitude'] as num).toDouble(),
      hospitalLatitude: (json['hospitalLatitude'] as num).toDouble(),
      hospitalLongitude: (json['hospitalLongitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateAppointmentParamsToJson(
        CreateAppointmentParams instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'patientGender': instance.patientGender,
      'patientRelationship': instance.patientRelationship,
      'mobileNumber': instance.mobileNumber,
      'noOfCaretakers': instance.noOfCaretakers,
      'caretakerGender': instance.caretakerGender,
      'caretakerLanguage': instance.caretakerLanguage,
      'taxiNeeded': const BoolConverter().toJson(instance.taxiNeeded),
      'acTaxi': const BoolConverter().toJson(instance.acTaxi),
      'drivetaxi': const BoolConverter().toJson(instance.drivetaxi),
      'visitDate': instance.visitDate.toIso8601String(),
      'pickUpAddress': instance.pickUpAddress,
      'pickUpPinCode': instance.pickUpPinCode,
      'hospital': instance.hospital,
      'doctorsName': instance.doctorsName,
      'visitPurpose': instance.visitPurpose,
      'apptDuration': instance.apptDuration,
      'caretaker': instance.caretaker,
      'pickUpLatitude': instance.pickUpLatitude,
      'pickUpLongitude': instance.pickUpLongitude,
      'hospitalLatitude': instance.hospitalLatitude,
      'hospitalLongitude': instance.hospitalLongitude,
    };
