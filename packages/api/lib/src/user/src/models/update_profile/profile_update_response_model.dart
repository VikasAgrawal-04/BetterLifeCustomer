// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/src/auth/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_update_response_model.g.dart';

@JsonSerializable()
class ProfileUpdateResponseModel {
  final String message;
  final int status;
  final User user;

  ProfileUpdateResponseModel({
    required this.message,
    required this.status,
    required this.user,
  });

  factory ProfileUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateResponseModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProfileUpdateResponseModelToJson(this);
}
