// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  final String mobileNumber;

  @JsonKey(name: 'OTP')
  final String otp;

  OtpModel({required this.mobileNumber, required this.otp});

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}
