// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      fullName: json['fullName'] as String?,
      email: json['emailId'] as String?,
      phoneNumber: json['contactNumber'] as int?,
      password: json['password'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
      address: json['address'] as String?,
      pincode: json['pinCode'] as String?,
      fathersName: json['fathersName'] as String?,
      mothersName: json['mothersName'] as String?,
      alternateNumber: json['alternateContactNumber'] as String?,
      firebaseDeviceToken: json['firebase_device_token'] as String?,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emailId': instance.email,
      'contactNumber': instance.phoneNumber,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'address': instance.address,
      'pinCode': instance.pincode,
      'fathersName': instance.fathersName,
      'mothersName': instance.mothersName,
      'alternateContactNumber': instance.alternateNumber,
      'firebase_device_token': instance.firebaseDeviceToken,
    };
