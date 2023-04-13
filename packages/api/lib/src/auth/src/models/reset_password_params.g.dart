// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordParams _$ResetPasswordParamsFromJson(Map<String, dynamic> json) =>
    ResetPasswordParams(
      mobile: json['mobile'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$ResetPasswordParamsToJson(
        ResetPasswordParams instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
