// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_appointment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareData _$CareDataFromJson(Map<String, dynamic> json) => CareData(
      apptid: json['apptid'] as int?,
      visitdate: json['visitdate'] as String?,
      pickuptime: json['pickuptime'] as String?,
      patientname: json['patientname'] as String?,
      hospital: json['hospital'] as String?,
      pickaddress: json['pickaddress'] as String?,
      doctor: json['doctor'] as String?,
      patientmobile: json['patientmobile'] as String?,
      relativename: json['relativename'] as String?,
      relativemobileno: json['relativemobileno'] as String?,
      taxineeded: json['taxineeded'] as String?,
      startappointment: json['startappointment'] as String?,
      startdatetime: json['startdatetime'] as String?,
      finished: json['finished'] as String?,
    );

Map<String, dynamic> _$CareDataToJson(CareData instance) => <String, dynamic>{
      'apptid': instance.apptid,
      'visitdate': instance.visitdate,
      'pickuptime': instance.pickuptime,
      'patientname': instance.patientname,
      'hospital': instance.hospital,
      'pickaddress': instance.pickaddress,
      'doctor': instance.doctor,
      'patientmobile': instance.patientmobile,
      'relativename': instance.relativename,
      'relativemobileno': instance.relativemobileno,
      'taxineeded': instance.taxineeded,
      'startappointment': instance.startappointment,
      'startdatetime': instance.startdatetime,
      'finished': instance.finished,
    };
