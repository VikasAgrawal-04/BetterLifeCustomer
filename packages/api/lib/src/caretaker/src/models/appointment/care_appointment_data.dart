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
      this.finished});

  factory CareData.fromJson(Map<String, dynamic> json) =>
      _$CareDataFromJson(json);

  Map<String, dynamic> toJson() => _$CareDataToJson(this);
}
