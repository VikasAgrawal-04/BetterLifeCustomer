import 'package:api/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_details.g.dart';

@JsonSerializable()
class AppointmentDetails {
  AppointmentDetails({
    required this.appointmentId,
    required this.patientName,
    required this.patientGender,
    required this.realationship,
    required this.patientMobile,
    required this.caretakerGender,
    required this.caretakerLanguage,
    required this.taxiNeeded,
    required this.acTaxi,
    required this.pickAddress,
    required this.pickPincode,
    required this.hospital,
    required this.doctor,
    required this.purpose,
    this.caretaker = const [],
    this.pickUpLatitude = 0.0,
    this.pickUpLongitude = 0.0,
    this.hospitalLatitude = 0.0,
    this.hospitalLongitude = 0.0,
  });

  final int appointmentId;
  final String patientName;
  final String patientGender;
  final String realationship;
  final String patientMobile;
  final String caretakerGender;
  final String caretakerLanguage;

  @BoolConverter()
  final bool taxiNeeded;

  @BoolConverter()
  final bool acTaxi;

  final String pickAddress;
  final String pickPincode;
  final String hospital;
  final String doctor;
  final String purpose;

  @JsonKey(defaultValue: [])
  final List<int> caretaker;
  final double? pickUpLatitude;
  final double? pickUpLongitude;
  final double? hospitalLatitude;
  final double? hospitalLongitude;

  factory AppointmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDetailsToJson(this);

  AppointmentDetails copyWith({
    int? appointmentId,
    String? patientName,
    String? patientGender,
    String? realationship,
    String? patientMobile,
    String? caretakerGender,
    String? caretakerLanguage,
    bool? taxiNeeded,
    bool? acTaxi,
    String? pickAddress,
    String? pickPincode,
    String? hospital,
    String? doctor,
    String? purpose,
    List<int>? caretaker,
    double? pickUpLatitude,
    double? pickUpLongitude,
    double? hospitalLatitude,
    double? hospitalLongitude,
  }) {
    return AppointmentDetails(
      appointmentId: appointmentId ?? this.appointmentId,
      patientName: patientName ?? this.patientName,
      patientGender: patientGender ?? this.patientGender,
      realationship: realationship ?? this.realationship,
      patientMobile: patientMobile ?? this.patientMobile,
      caretakerGender: caretakerGender ?? this.caretakerGender,
      caretakerLanguage: caretakerLanguage ?? this.caretakerLanguage,
      taxiNeeded: taxiNeeded ?? this.taxiNeeded,
      acTaxi: acTaxi ?? this.acTaxi,
      pickAddress: pickAddress ?? this.pickAddress,
      pickPincode: pickPincode ?? this.pickPincode,
      hospital: hospital ?? this.hospital,
      doctor: doctor ?? this.doctor,
      purpose: purpose ?? this.purpose,
      caretaker: caretaker ?? this.caretaker,
      pickUpLatitude: pickUpLatitude ?? this.pickUpLatitude,
      pickUpLongitude: pickUpLongitude ?? this.pickUpLongitude,
      hospitalLatitude: hospitalLatitude ?? this.hospitalLatitude,
      hospitalLongitude: hospitalLongitude ?? this.hospitalLongitude,
    );
  }
}
