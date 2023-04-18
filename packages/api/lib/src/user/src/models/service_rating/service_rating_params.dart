// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'service_rating_params.g.dart';

@JsonSerializable()
class ServiceRatingParams {
  final int appointmentId;
  final int rating1;
  final String comment1;
  final String? comment2;
  final int? rating2;
  ServiceRatingParams({
    required this.appointmentId,
    required this.rating1,
    required this.comment1,
    this.comment2,
    this.rating2,
  });

  factory ServiceRatingParams.fromJson(Map<String, dynamic> json) =>
      _$ServiceRatingParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRatingParamsToJson(this);
}
