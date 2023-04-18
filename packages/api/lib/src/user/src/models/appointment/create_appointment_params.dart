// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../../../converters/converters.dart';

part 'create_appointment_params.g.dart';

@JsonSerializable()
class CreateAppointmentParams {
  final String patientName;

  // @JsonKey(toJson: _genderToJson)
  final String patientGender;

  final String patientRelationship;
  final String mobileNumber;
  final String noOfCaretakers;

  // @JsonKey(toJson: _genderToJson)
  final String caretakerGender;
  final String caretakerLanguage;

  @BoolConverter()
  final bool taxiNeeded;

  @BoolConverter()
  final bool acTaxi;

  @BoolConverter()
  final bool drivetaxi;

  // @JsonKey(toJson: (DateTime date) => _dateToJson(date, pickUpTime))
  @DateConverter()
  final DateTime visitDate;

  // @JsonKey(toJson: _timeToJson)
  // final DateTime pickUpTime;
  final String pickUpAddress;
  final String pickUpPinCode;
  final String hospital;
  final String doctorsName;
  final String visitPurpose;
  final String apptDuration;

  CreateAppointmentParams({
    required this.patientName,
    required this.patientGender,
    required this.patientRelationship,
    required this.mobileNumber,
    required this.noOfCaretakers,
    required this.caretakerGender,
    required this.caretakerLanguage,
    required this.taxiNeeded,
    required this.acTaxi,
    required this.drivetaxi,
    required this.visitDate,
    required this.pickUpAddress,
    required this.pickUpPinCode,
    required this.hospital,
    required this.doctorsName,
    required this.visitPurpose,
    required this.apptDuration,
  });

  // static String _dateToJson(DateTime date, DateTime time) {
  //   final newDate = date.add(Duration(hours: time.hour, minutes: time.minute));
  //   return MyDateFormat.formatDate(, format: 'yyyy-MM-dd');
  // }

  // static String _timeToJson(DateTime date) => '${date.hour}:${date.minute}';

  factory CreateAppointmentParams.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAppointmentParamsToJson(this);

  // static int _boolToJson(bool value) {
  //   return value ? 1 : 0;
  // }

  // static String _genderToJson(String value) {
  //   return value.characters.first.toUpperCase();
  // }
}
