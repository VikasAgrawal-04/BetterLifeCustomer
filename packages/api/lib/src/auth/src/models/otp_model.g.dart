// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpModel _$OtpModelFromJson(Map<String, dynamic> json) => OtpModel(
      mobileNumber: json['mobileNumber'] as String,
      otp: json['OTP'] as String,
    );

Map<String, dynamic> _$OtpModelToJson(OtpModel instance) => <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'OTP': instance.otp,
    };
