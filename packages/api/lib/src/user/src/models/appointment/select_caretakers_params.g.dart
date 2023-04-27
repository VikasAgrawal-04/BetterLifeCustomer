// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_caretakers_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectCaretakerParams _$SelectCaretakerParamsFromJson(
        Map<String, dynamic> json) =>
    SelectCaretakerParams(
      caretakerIds:
          (json['caretakerIds'] as List<dynamic>).map((e) => e as int).toList(),
      appointmentId: json['appointmentId'] as int?,
    );

Map<String, dynamic> _$SelectCaretakerParamsToJson(
    SelectCaretakerParams instance) {
  final val = <String, dynamic>{
    'caretakerIds': instance.caretakerIds,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('appointmentId', instance.appointmentId);
  return val;
}
