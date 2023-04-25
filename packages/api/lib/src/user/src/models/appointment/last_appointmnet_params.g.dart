// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_appointmnet_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastAppointmentParams _$LastAppointmentParamsFromJson(
        Map<String, dynamic> json) =>
    LastAppointmentParams(
      caretakerIds:
          (json['caretakerIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$LastAppointmentParamsToJson(
        LastAppointmentParams instance) =>
    <String, dynamic>{
      'caretakerIds': instance.caretakerIds,
    };
