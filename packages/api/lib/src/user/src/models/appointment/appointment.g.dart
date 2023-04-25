// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponseModel _$AppointmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentResponseModel(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AppointmentResponseModelToJson(
        AppointmentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'code': instance.code,
      'message': instance.message,
    };

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      apptid: json['apptid'] as int?,
      visitdate: json['visitdate'] as String?,
      rating: json['rating'] as int?,
      rating2: json['rating2'] as int?,
      pickuptime: json['pickuptime'] as String?,
      pickaddress: json['pickaddress'] as String?,
      hospital: json['hospital'] as String?,
      caretakerid: json['caretakerid'] as int?,
      doctor: json['doctor'] as String?,
      otp: json['otp'] as String?,
      taxineeded: Appointment._boolFromJson(json['taxineeded']),
      caretakers: (json['caretakers'] as List<dynamic>?)
          ?.map((e) => Caretaker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'apptid': instance.apptid,
      'visitdate': instance.visitdate,
      'rating': instance.rating,
      'rating2': instance.rating2,
      'pickuptime': instance.pickuptime,
      'pickaddress': instance.pickaddress,
      'hospital': instance.hospital,
      'caretakerid': instance.caretakerid,
      'doctor': instance.doctor,
      'otp': instance.otp,
      'taxineeded': instance.taxineeded,
      'caretakers': instance.caretakers,
    };

Caretaker _$CaretakerFromJson(Map<String, dynamic> json) => Caretaker(
      userid: json['userid'] as int?,
      fullname: json['fullname'] as String?,
      mobile: json['mobile'] as String?,
    )..rating = json['rating'] as int?;

Map<String, dynamic> _$CaretakerToJson(Caretaker instance) => <String, dynamic>{
      'userid': instance.userid,
      'fullname': instance.fullname,
      'mobile': instance.mobile,
      'rating': instance.rating,
    };
