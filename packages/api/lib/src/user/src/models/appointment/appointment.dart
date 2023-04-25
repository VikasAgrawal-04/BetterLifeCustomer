// ignore_for_file: public_member_api_docs, sort_constructors_first
// class Appointment {
//   int? apptid;
//   String? visitdate;
//   String? pickuptime;
//   String? pickaddress;
//   String? hospital;
//   int? caretakerid;
//   Appointment({
//     this.apptid,
//     this.visitdate,
//     this.pickuptime,
//     this.pickaddress,
//     required this.hospital,
//     this.caretakerid,
//   });
// }

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
  int? caretakerid;
  String? doctor;
  String? otp;

  @JsonKey(name: 'taxineeded', fromJson: _boolFromJson)
  bool taxineeded;

  @JsonKey(name: 'caretakers')
  List<Caretaker>? caretakers;

  Appointment({
    this.apptid,
    this.visitdate,
    this.rating,
    this.rating2,
    this.pickuptime,
    this.pickaddress,
    this.hospital,
    this.caretakerid,
    this.doctor,
    this.otp,
    required this.taxineeded,
    this.caretakers,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);

  // Appointment.fromJson(Map<String, dynamic> json) {
  //   apptid = json['apptid'];
  //   visitdate = json['visitdate'];
  //   pickuptime = json['pickuptime'];
  //   pickaddress = json['pickaddress'];
  //   hospital = json['hospital'];
  //   caretakerid = json['caretakerid'];
  //   if (json['caretaker_data1'] != null) {
  //     caretakerData1 = <Caretakers>[];
  //     json['caretaker_data1'].forEach((v) {
  //       caretakerData1!.add(Caretakers.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['apptid'] = apptid;
  //   data['visitdate'] = visitdate;
  //   data['pickuptime'] = pickuptime;
  //   data['pickaddress'] = pickaddress;
  //   data['hospital'] = hospital;
  //   data['caretakerid'] = caretakerid;
  //   if (caretakerData1 != null) {
  //     data['caretaker_data1'] = caretakerData1!.map((v) => v.toJson()).toList();
  //   }

  //   return data;
  // }

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
