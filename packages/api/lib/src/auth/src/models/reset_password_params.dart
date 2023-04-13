// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_params.g.dart';

@JsonSerializable()
class ResetPasswordParams {
  final String mobile;
  final String password;
  final String passwordConfirmation;
  // final String userToken;

  ResetPasswordParams({
    required this.mobile,
    required this.password,
    required this.passwordConfirmation,
    // required this.userToken,
  });

  factory ResetPasswordParams.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordParamsToJson(this);
}
