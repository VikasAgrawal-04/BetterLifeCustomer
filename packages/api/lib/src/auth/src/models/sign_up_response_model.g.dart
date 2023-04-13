// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      errors: json['errors'] as Map<String, dynamic>?,
      status: json['status'] as int,
      message: json['message'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'errors': instance.errors,
    };
