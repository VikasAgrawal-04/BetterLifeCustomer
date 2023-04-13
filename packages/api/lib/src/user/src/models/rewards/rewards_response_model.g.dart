// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsResponseModel _$RewardsResponseModelFromJson(
        Map<String, dynamic> json) =>
    RewardsResponseModel(
      status: json['status'] as int?,
      rewardsAllow: (json['rewards_allow'] as List<dynamic>?)
          ?.map((e) => Rewards.fromJson(e as Map<String, dynamic>))
          .toList(),
      rewardsMorePoints: (json['rewards_more_points'] as List<dynamic>?)
          ?.map((e) => Rewards.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RewardsResponseModelToJson(
        RewardsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'rewards_allow': instance.rewardsAllow,
      'rewards_more_points': instance.rewardsMorePoints,
    };
