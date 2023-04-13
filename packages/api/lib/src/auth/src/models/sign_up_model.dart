// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  @JsonKey(name: 'fullName')
  String? fullName;

  @JsonKey(name: 'emailId')
  String? email;

  @JsonKey(name: 'contactNumber')
  int? phoneNumber;

  String? password;

  @JsonKey(name: 'password_confirmation')
  String? confirmPassword;

  String? address;

  @JsonKey(name: 'pinCode')
  String? pincode;

  String? fathersName;

  String? mothersName;

  @JsonKey(name: 'alternateContactNumber')
  String? alternateNumber;

  @JsonKey(name: 'firebase_device_token')
  String? firebaseDeviceToken;

  // String? countryCode;

  SignUpModel({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
    this.address,
    this.pincode,
    this.fathersName,
    this.mothersName,
    this.alternateNumber,
    this.firebaseDeviceToken,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
