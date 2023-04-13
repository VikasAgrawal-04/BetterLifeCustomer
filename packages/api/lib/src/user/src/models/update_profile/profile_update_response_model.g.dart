// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateResponseModel _$ProfileUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateResponseModel(
      message: json['message'] as String,
      status: json['status'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileUpdateResponseModelToJson(
        ProfileUpdateResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'user': instance.user,
    };
