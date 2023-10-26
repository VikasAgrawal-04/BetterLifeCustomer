import 'package:api/src/caretaker/src/models/appointment/care_appointment_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'care_appointment_details.g.dart';

@JsonSerializable()
class CareAppointmentDetails {
  final bool status;
  @JsonKey(name: 'data')
  final CareData data;
  final String code;
  final String message;

  CareAppointmentDetails({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  factory CareAppointmentDetails.fromJson(Map<String, dynamic> json) =>
      _$CareAppointmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CareAppointmentDetailsToJson(this);
}
