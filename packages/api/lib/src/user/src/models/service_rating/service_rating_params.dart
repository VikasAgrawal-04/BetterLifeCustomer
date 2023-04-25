// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'service_rating_params.g.dart';

@JsonSerializable()
class ServiceRatingParams {
  ServiceRatingParams({
    required this.appointmentId,
    required this.rating,
    required this.comment,
    required this.caretakerId,
  });

  final int appointmentId;

  @JsonKey(name: 'rating1')
  final int rating;

  @JsonKey(name: 'comment1')
  final String comment;

  @JsonKey(name: 'caretaker1')
  final int caretakerId;

  factory ServiceRatingParams.fromJson(Map<String, dynamic> json) =>
      _$ServiceRatingParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceRatingParamsToJson(this);
}
