import 'package:json_annotation/json_annotation.dart';

part 'care_appointment.g.dart';

@JsonSerializable()
class CareAppointment {
  final int? apptid;
  final String? visitdate;
  final String? pickuptime;
  final String? patientname;
  final String? hospital;
  final String? pickaddress;
  final int? rating;
  bool viewDetials;

  CareAppointment(
      {this.apptid,
      this.visitdate,
      this.pickuptime,
      this.patientname,
      this.hospital,
      this.pickaddress,
      this.rating,
      this.viewDetials = false});

  factory CareAppointment.fromJson(Map<String, dynamic> json) =>
      _$CareAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$CareAppointmentToJson(this);
}
