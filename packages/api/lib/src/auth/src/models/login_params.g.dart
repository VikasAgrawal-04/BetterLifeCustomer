// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) => LoginParams(
      mobile: json['mobileNumber'] as int,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobile,
      'password': instance.password,
    };
