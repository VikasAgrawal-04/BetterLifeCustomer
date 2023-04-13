// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_params.g.dart';

@JsonSerializable()
class LoginParams {
  @JsonKey(name: 'mobileNumber')
  final int mobile;
  final String password;

  LoginParams({
    required this.mobile,
    required this.password,
  });

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}
