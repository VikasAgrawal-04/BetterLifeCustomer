// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_rating_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRatingParams _$ServiceRatingParamsFromJson(Map<String, dynamic> json) =>
    ServiceRatingParams(
      appointmentId: json['appointmentId'] as int,
      rating1: json['rating1'] as int,
      comment1: json['comment1'] as String,
      comment2: json['comment2'] as String?,
      rating2: json['rating2'] as int?,
    );

Map<String, dynamic> _$ServiceRatingParamsToJson(
        ServiceRatingParams instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'rating1': instance.rating1,
      'comment1': instance.comment1,
      'comment2': instance.comment2,
      'rating2': instance.rating2,
    };
