// To parse this JSON data, do
//
//     final caretakerLocationModel = caretakerLocationModelFromJson(jsonString);

import 'dart:convert';

CaretakerLocationModel caretakerLocationModelFromJson(String str) =>
    CaretakerLocationModel.fromJson(json.decode(str));

String caretakerLocationModelToJson(CaretakerLocationModel data) =>
    json.encode(data.toJson());

class CaretakerLocationModel {
  bool status;
  CareLocation data;
  String code;
  String message;

  CaretakerLocationModel({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  CaretakerLocationModel copyWith({
    bool? status,
    CareLocation? data,
    String? code,
    String? message,
  }) =>
      CaretakerLocationModel(
        status: status ?? this.status,
        data: data ?? this.data,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory CaretakerLocationModel.fromJson(Map<String, dynamic> json) =>
      CaretakerLocationModel(
        status: json["status"],
        data: CareLocation.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "code": code,
        "message": message,
      };
}

class CareLocation {
  String caretaker1Latitude;
  String caretaker1Longitude;
  String caretaker1ApptStatus;
  dynamic caretaker2Latitude;
  dynamic caretaker2Longitude;
  dynamic caretaker2ApptStatus;

  CareLocation({
    required this.caretaker1Latitude,
    required this.caretaker1Longitude,
    required this.caretaker1ApptStatus,
    required this.caretaker2Latitude,
    required this.caretaker2Longitude,
    required this.caretaker2ApptStatus,
  });

  CareLocation copyWith({
    String? caretaker1Latitude,
    String? caretaker1Longitude,
    String? caretaker1ApptStatus,
    dynamic caretaker2Latitude,
    dynamic caretaker2Longitude,
    dynamic caretaker2ApptStatus,
  }) =>
      CareLocation(
        caretaker1Latitude: caretaker1Latitude ?? this.caretaker1Latitude,
        caretaker1Longitude: caretaker1Longitude ?? this.caretaker1Longitude,
        caretaker1ApptStatus: caretaker1ApptStatus ?? this.caretaker1ApptStatus,
        caretaker2Latitude: caretaker2Latitude ?? this.caretaker2Latitude,
        caretaker2Longitude: caretaker2Longitude ?? this.caretaker2Longitude,
        caretaker2ApptStatus: caretaker2ApptStatus ?? this.caretaker2ApptStatus,
      );

  factory CareLocation.fromJson(Map<String, dynamic> json) => CareLocation(
        caretaker1Latitude: json["caretaker1Latitude"],
        caretaker1Longitude: json["caretaker1Longitude"],
        caretaker1ApptStatus: json["caretaker1ApptStatus"],
        caretaker2Latitude: json["caretaker2Latitude"],
        caretaker2Longitude: json["caretaker2Longitude"],
        caretaker2ApptStatus: json["caretaker2ApptStatus"],
      );

  Map<String, dynamic> toJson() => {
        "caretaker1Latitude": caretaker1Latitude,
        "caretaker1Longitude": caretaker1Longitude,
        "caretaker1ApptStatus": caretaker1ApptStatus,
        "caretaker2Latitude": caretaker2Latitude,
        "caretaker2Longitude": caretaker2Longitude,
        "caretaker2ApptStatus": caretaker2ApptStatus,
      };
}
