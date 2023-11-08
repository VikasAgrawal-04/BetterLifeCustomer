import 'package:json_annotation/json_annotation.dart';

part 'care_appointment_data.g.dart';

@JsonSerializable()
class CareData {
  final int? apptid;
  final String? visitdate;
  final String? pickuptime;
  final String? patientname;
  final String? hospital;
  final String? pickaddress;
  final String? doctor;
  final String? patientmobile;
  final String? relativename;
  final String? relativemobileno;
  final String? taxineeded;
  final String? startappointment;
  final String? startdatetime;
  final String? finished;

  @JsonKey(name: 'appointment_test')
  List<AppointmentSubDetails>? appointmentTest;

  @JsonKey(name: 'appointment_diet')
  List<AppointmentSubDetails>? appointmentDiet;

  @JsonKey(name: 'appointment_doctors_note')
  List<AppointmentSubDetails>? appointmentDoctorsNote;

  @JsonKey(name: 'appointment_prescription')
  List<AppointmentSubDetails>? appointmentPrescription;

  @JsonKey(name: 'appointment_test_notes')
  List<AppointmentNotes>? appointmentTestNotes;

  @JsonKey(name: 'appointment_diet_notes')
  List<AppointmentNotes>? appointmentDietNotes;

  @JsonKey(name: 'appointment_doctors_note_notes')
  List<AppointmentNotes>? appointmentDoctorsNoteNotes;

  CareData(
      {this.apptid,
      this.visitdate,
      this.pickuptime,
      this.patientname,
      this.hospital,
      this.pickaddress,
      this.doctor,
      this.patientmobile,
      this.relativename,
      this.relativemobileno,
      this.taxineeded,
      this.startappointment,
      this.startdatetime,
      this.finished,
      this.appointmentTest});

  factory CareData.fromJson(Map<String, dynamic> json) =>
      _$CareDataFromJson(json);

  Map<String, dynamic> toJson() => _$CareDataToJson(this);
}

@JsonSerializable()
class AppointmentSubDetails {
  final int id;
  final int apptid;
  final String filename;
  final String image;
  final String linktype;
  final int isdeleted;

  AppointmentSubDetails(
      {required this.id,
      required this.apptid,
      required this.filename,
      required this.image,
      required this.linktype,
      required this.isdeleted});
  factory AppointmentSubDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentSubDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentSubDetailsToJson(this);
}

@JsonSerializable()
class AppointmentNotes {
  final int id;
  final int apptid;
  final String filetext;
  final String linktype;
  final int isdeleted;

  AppointmentNotes(
      {required this.id,
      required this.apptid,
      required this.linktype,
      required this.filetext,
      required this.isdeleted});
  factory AppointmentNotes.fromJson(Map<String, dynamic> json) =>
      _$AppointmentNotesFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentNotesToJson(this);
}
