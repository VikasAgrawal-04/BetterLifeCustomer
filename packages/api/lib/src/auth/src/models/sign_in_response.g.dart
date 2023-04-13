// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      status: json['status'] as bool?,
      balancePoints: json['balance_points'] as int?,
      token: json['token'] as String?,
      message: json['message'] as String?,
      user: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'balance_points': instance.balancePoints,
      'token': instance.token,
      'message': instance.message,
      'data': instance.user,
    };
