import 'models.dart';

class otpResponse {
  bool? status;
  User? data;
  String? code;
  String? message;

  otpResponse({this.status, this.data, this.code, this.message});

  otpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null && json['data'] is Map
        ? User.fromJson(json['data'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
