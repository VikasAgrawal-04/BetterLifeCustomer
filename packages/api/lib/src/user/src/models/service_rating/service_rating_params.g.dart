// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_rating_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRatingParams _$ServiceRatingParamsFromJson(Map<String, dynamic> json) =>
    ServiceRatingParams(
      appointmentId: json['appointmentId'] as int,
      rating: json['rating1'] as int,
      comment: json['comment1'] as String,
      caretakerId: json['caretaker1'] as int,
    );

Map<String, dynamic> _$ServiceRatingParamsToJson(
        ServiceRatingParams instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'rating1': instance.rating,
      'comment1': instance.comment,
      'caretaker1': instance.caretakerId,
    };
