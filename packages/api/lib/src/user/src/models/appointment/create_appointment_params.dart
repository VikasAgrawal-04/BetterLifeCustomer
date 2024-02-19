import 'package:json_annotation/json_annotation.dart';

import '../../../../../converters/converters.dart';

part 'create_appointment_params.g.dart';

@JsonSerializable()
class CreateAppointmentParams {
  final String patientName;

  final String patientGender;

  final String patientRelationship;
  final String mobileNumber;
  final String noOfCaretakers;

  final String caretakerGender;
  final String caretakerLanguage;

  @BoolConverter()
  final bool taxiNeeded;

  @BoolConverter()
  final bool acTaxi;

  @BoolConverter()
  final bool drivetaxi;

  @DateConverter()
  final DateTime visitDate;

  final String pickUpAddress;
  final String pickUpPinCode;
  final String hospital;
  final String doctorsName;
  final String visitPurpose;
  final String apptDuration;
  final List<int> caretaker;
  final double pickUpLatitude;
  final double pickUpLongitude;
  final double hospitalLatitude;
  final double hospitalLongitude;

  CreateAppointmentParams({
    required this.patientName,
    required this.patientGender,
    required this.patientRelationship,
    required this.mobileNumber,
    required this.noOfCaretakers,
    required this.caretakerGender,
    required this.caretakerLanguage,
    this.taxiNeeded = false,
    this.acTaxi = false,
    required this.drivetaxi,
    required this.visitDate,
    required this.pickUpAddress,
    required this.pickUpPinCode,
    required this.hospital,
    required this.doctorsName,
    required this.visitPurpose,
    required this.apptDuration,
    required this.caretaker,
    required this.pickUpLatitude,
    required this.pickUpLongitude,
    required this.hospitalLatitude,
    required this.hospitalLongitude,
  });

  factory CreateAppointmentParams.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAppointmentParamsToJson(this);

  CreateAppointmentParams copyWith({
    String? patientName,
    String? patientGender,
    String? patientRelationship,
    String? mobileNumber,
    String? noOfCaretakers,
    String? caretakerGender,
    String? caretakerLanguage,
    bool? taxiNeeded,
    bool? acTaxi,
    bool? drivetaxi,
    DateTime? visitDate,
    String? pickUpAddress,
    String? pickUpPinCode,
    String? hospital,
    String? doctorsName,
    String? visitPurpose,
    String? apptDuration,
    List<int>? caretaker,
    double? pickUpLatitude,
    double? pickUpLongitude,
    double? hospitalLatitude,
    double? hospitalLongitude,
  }) {
    return CreateAppointmentParams(
      patientName: patientName ?? this.patientName,
      patientGender: patientGender ?? this.patientGender,
      patientRelationship: patientRelationship ?? this.patientRelationship,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      noOfCaretakers: noOfCaretakers ?? this.noOfCaretakers,
      caretakerGender: caretakerGender ?? this.caretakerGender,
      caretakerLanguage: caretakerLanguage ?? this.caretakerLanguage,
      taxiNeeded: taxiNeeded ?? this.taxiNeeded,
      acTaxi: acTaxi ?? this.acTaxi,
      drivetaxi: drivetaxi ?? this.drivetaxi,
      visitDate: visitDate ?? this.visitDate,
      pickUpAddress: pickUpAddress ?? this.pickUpAddress,
      pickUpPinCode: pickUpPinCode ?? this.pickUpPinCode,
      hospital: hospital ?? this.hospital,
      doctorsName: doctorsName ?? this.doctorsName,
      visitPurpose: visitPurpose ?? this.visitPurpose,
      apptDuration: apptDuration ?? this.apptDuration,
      caretaker: caretaker ?? this.caretaker,
      pickUpLatitude: pickUpLatitude ?? this.pickUpLatitude,
      pickUpLongitude: pickUpLongitude ?? this.pickUpLongitude,
      hospitalLatitude: hospitalLatitude ?? this.hospitalLatitude,
      hospitalLongitude: hospitalLongitude ?? this.hospitalLongitude,
    );
  }
}
