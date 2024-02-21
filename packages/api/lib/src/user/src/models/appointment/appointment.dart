import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class AppointmentResponseModel {
  bool? status;
  List<Appointment>? data;
  String? code;
  String? message;

  AppointmentResponseModel({this.status, this.data, this.code, this.message});

  factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseModelToJson(this);
}

@JsonSerializable()
class Appointment {
  int? apptid;

  String? visitdate;
  int? rating;
  int? rating2;

  String? pickuptime;
  String? pickaddress;
  String? hospital;
  String? hospitalLatitude;
  String? hospitalLongitude;
  String? startappointment;
  int? caretakerid;
  String? doctor;
  String? otp;
  String? caretakerApptStatus;

  @JsonKey(defaultValue: [])
  List<int> caretaker;

  @JsonKey(name: 'taxineeded', fromJson: _boolFromJson)
  bool taxineeded;

  @JsonKey(name: 'caretakers')
  List<Caretaker>? caretakers;

  Appointment(
      {this.apptid,
      this.visitdate,
      this.rating,
      this.rating2,
      this.pickuptime,
      this.pickaddress,
      this.hospital,
      this.caretakerid,
      this.doctor,
      this.otp,
      this.caretaker = const [],
      required this.taxineeded,
      this.caretakers,
      this.hospitalLatitude,
      this.hospitalLongitude,
      this.startappointment,
      this.caretakerApptStatus});

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);

  String get caretakerName {
    if (caretakers == null || caretakers!.isEmpty) {
      return '';
    }
    return caretakers?.first.fullname ?? '';
  }

  static bool _boolFromJson(value) {
    if (value is String) {
      return value == '1';
    }
    return value == 1;
  }
}

@JsonSerializable()
class Caretaker {
  int? userid;
  String? fullname;
  String? mobile;
  int? rating;

  Caretaker({this.userid, this.fullname, this.mobile});

  factory Caretaker.fromJson(Map<String, dynamic> json) =>
      _$CaretakerFromJson(json);

  Map<String, dynamic> toJson() => _$CaretakerToJson(this);
}
