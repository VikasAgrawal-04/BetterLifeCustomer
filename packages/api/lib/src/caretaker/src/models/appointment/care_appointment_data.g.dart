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
      appointmentTest: (json['appointment_test'] as List<dynamic>?)
          ?.map(
              (e) => AppointmentSubDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..appointmentDiet = (json['appointment_diet'] as List<dynamic>?)
          ?.map(
              (e) => AppointmentSubDetails.fromJson(e as Map<String, dynamic>))
          .toList()
      ..appointmentDoctorsNote = (json['appointment_doctors_note']
              as List<dynamic>?)
          ?.map(
              (e) => AppointmentSubDetails.fromJson(e as Map<String, dynamic>))
          .toList()
      ..appointmentPrescription = (json['appointment_prescription']
              as List<dynamic>?)
          ?.map(
              (e) => AppointmentSubDetails.fromJson(e as Map<String, dynamic>))
          .toList()
      ..appointmentTestNotes =
          (json['appointment_test_notes'] as List<dynamic>?)
              ?.map((e) => AppointmentNotes.fromJson(e as Map<String, dynamic>))
              .toList()
      ..appointmentDietNotes =
          (json['appointment_diet_notes'] as List<dynamic>?)
              ?.map((e) => AppointmentNotes.fromJson(e as Map<String, dynamic>))
              .toList()
      ..appointmentDoctorsNoteNotes =
          (json['appointment_doctors_note_notes'] as List<dynamic>?)
              ?.map((e) => AppointmentNotes.fromJson(e as Map<String, dynamic>))
              .toList();

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
      'appointment_test': instance.appointmentTest,
      'appointment_diet': instance.appointmentDiet,
      'appointment_doctors_note': instance.appointmentDoctorsNote,
      'appointment_prescription': instance.appointmentPrescription,
      'appointment_test_notes': instance.appointmentTestNotes,
      'appointment_diet_notes': instance.appointmentDietNotes,
      'appointment_doctors_note_notes': instance.appointmentDoctorsNoteNotes,
    };

AppointmentSubDetails _$AppointmentSubDetailsFromJson(
        Map<String, dynamic> json) =>
    AppointmentSubDetails(
      id: json['id'] as int,
      apptid: json['apptid'] as int,
      filename: json['filename'] as String,
      image: json['image'] as String,
      linktype: json['linktype'] as String,
      isdeleted: json['isdeleted'] as int,
    );

Map<String, dynamic> _$AppointmentSubDetailsToJson(
        AppointmentSubDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apptid': instance.apptid,
      'filename': instance.filename,
      'image': instance.image,
      'linktype': instance.linktype,
      'isdeleted': instance.isdeleted,
    };

AppointmentNotes _$AppointmentNotesFromJson(Map<String, dynamic> json) =>
    AppointmentNotes(
      id: json['id'] as int,
      apptid: json['apptid'] as int,
      linktype: json['linktype'] as String,
      filetext: json['filetext'] as String,
      isdeleted: json['isdeleted'] as int,
    );

Map<String, dynamic> _$AppointmentNotesToJson(AppointmentNotes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apptid': instance.apptid,
      'filetext': instance.filetext,
      'linktype': instance.linktype,
      'isdeleted': instance.isdeleted,
    };
