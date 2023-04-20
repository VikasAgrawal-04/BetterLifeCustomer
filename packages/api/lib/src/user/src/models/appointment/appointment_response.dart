// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'appointment_response.g.dart';

@JsonSerializable()
class AppointmentResponse {
  final int id;
  final String message;
  AppointmentResponse({
    required this.id,
    required this.message,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}
