// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_caretaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpCaretakerModel _$SignUpCaretakerModelFromJson(
        Map<String, dynamic> json) =>
    SignUpCaretakerModel(
      fullname: json['fullname'] as String?,
      emailid: json['emailid'] as String?,
      mobileno: json['mobileno'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['password_confirmation'] as String?,
      gender: json['gender'] as String?,
      dateofbirth: json['dateofbirth'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      aadhar: json['aadhar'] as String?,
      qualification: json['qualification'] as String?,
      employedat: json['employedat'] as String?,
      profile: json['profile'] as String?,
      interview: json['interview'] as String?,
      candrive: json['candrive'] as String?,
      languageList: (json['language_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pincodeList: (json['pincode_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      firebaseDeviceToken: json['firebase_device_token'] as String?,
      drivingLicense: json['driving_licence_no'] as String?,
      valid: json['driving_licence_valid_till'] as String?,
    );

Map<String, dynamic> _$SignUpCaretakerModelToJson(
        SignUpCaretakerModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'emailid': instance.emailid,
      'mobileno': instance.mobileno,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'gender': instance.gender,
      'dateofbirth': instance.dateofbirth,
      'address': instance.address,
      'pincode': instance.pincode,
      'aadhar': instance.aadhar,
      'qualification': instance.qualification,
      'employedat': instance.employedat,
      'profile': instance.profile,
      'interview': instance.interview,
      'candrive': instance.candrive,
      'pincode_list': instance.pincodeList,
      'language_list': instance.languageList,
      'firebase_device_token': instance.firebaseDeviceToken,
      'driving_licence_no': instance.drivingLicense,
      'driving_licence_valid_till': instance.valid,
    };
