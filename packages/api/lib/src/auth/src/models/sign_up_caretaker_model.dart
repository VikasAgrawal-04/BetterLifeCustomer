import 'package:json_annotation/json_annotation.dart';

part 'sign_up_caretaker_model.g.dart';

@JsonSerializable()
class SignUpCaretakerModel {
  String? fullname;

  String? emailid;

  String? mobileno;

  String? password;

  @JsonKey(name: 'password_confirmation')
  String? confirmPassword;

  String? gender;

  String? dateofbirth;

  String? address;

  String? pincode;

  String? aadhar;

  String? qualification;

  String? employedat;

  String? profile;

  String? interview;

  String? candrive;

  @JsonKey(name: 'pincode_list')
  List<String>? pincodeList;

  @JsonKey(name: 'language_list')
  List<String>? languageList;

  @JsonKey(name: 'firebase_device_token')
  String? firebaseDeviceToken;

  SignUpCaretakerModel(
      {this.fullname,
      this.emailid,
      this.mobileno,
      this.password,
      this.confirmPassword,
      this.gender,
      this.dateofbirth,
      this.address,
      this.pincode,
      this.aadhar,
      this.qualification,
      this.employedat,
      this.profile,
      this.interview,
      this.candrive,
      this.languageList,
      this.pincodeList,
      this.firebaseDeviceToken});

  factory SignUpCaretakerModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpCaretakerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpCaretakerModelToJson(this);
}
