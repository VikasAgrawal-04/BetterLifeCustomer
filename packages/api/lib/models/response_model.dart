// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

typedef FromJson<T> = T Function(Object? json);
typedef ToJson<T> = T Function(Object? json);

// toJson generate
// copilot generate toJson typedef

// typedef toJson<T> = T Function(Object? json);

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<T> {
  const ResponseModel({
    this.status = false,
    this.message,
    this.code,
    this.data,
  });

  final bool status;
  final String? message;
  final String? code;
  final T? data;

  factory ResponseModel.fromJson(
          Map<String, dynamic> json, FromJson<T> fromJson) =>
      _$ResponseModelFromJson(json, fromJson);

  Map<String, dynamic> toJson(ToJson<T> toJson) =>
      _$ResponseModelToJson(this, toJson);
}
