// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  final int status;
  final String message;
  final String? token;

  @JsonKey(name: 'errors')
  final Map<String, dynamic>? errors;

  SignupResponseModel({
    this.errors,
    required this.status,
    required this.message,
    this.token,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);

  String error(Map<String, dynamic> errors) {
    String error = '';
    errors.forEach((key, value) => error += '$key: $value \n');
    return error;
  }
}
