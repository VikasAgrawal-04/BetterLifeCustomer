// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  const ResponseModel({
    this.status = false,
    this.message,
    this.code,
  });

  final bool status;
  final String? message;
  final String? code;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      message: map['message'] != null ? map['message'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      status: map['status'] == 'success' && map['code'] == '200',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseModel(status: $status, message: $message)';

  @override
  bool operator ==(covariant ResponseModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
