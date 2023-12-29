// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      fullName: json['fullName'] as String?,
      email: json['emailId'] as String?,
      mobile: json['mobileNumber'] as String?,
      userType: json['userType'] as String?,
      userToken: json['UserToken'] as String?,
      balancePoints: json['balance_points'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'emailId': instance.email,
      'mobileNumber': instance.mobile,
      'userType': instance.userType,
      'UserToken': instance.userToken,
      'balance_points': instance.balancePoints,
    };
