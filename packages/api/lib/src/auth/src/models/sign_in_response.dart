import 'package:api/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  bool? status;

  @JsonKey(name: 'balance_points')
  int? balancePoints;
  String? token;
  String? message;
  @JsonKey(name: 'data')
  User? user;

  @BoolConverter()
  @JsonKey(defaultValue: true)
  bool isOtpVerified;

  SignInResponse({
    this.isOtpVerified = true,
    this.status,
    this.balancePoints,
    this.token,
    this.message,
    this.user,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
