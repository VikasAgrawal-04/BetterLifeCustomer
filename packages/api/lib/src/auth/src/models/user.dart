// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class User {
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'emailId')
  String? email;
  @JsonKey(name: 'mobileNumber')
  String? mobile;

  @JsonKey(name: 'userType')
  String? userType;
  String? userToken;

  @JsonKey(name: 'balance_points')
  int? balancePoints;

  User({
    this.fullName,
    this.email,
    this.mobile,
    this.userType,
    this.userToken,
    this.balancePoints,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
