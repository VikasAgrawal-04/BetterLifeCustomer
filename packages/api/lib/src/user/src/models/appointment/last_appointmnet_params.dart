import 'package:json_annotation/json_annotation.dart';

part 'last_appointmnet_params.g.dart';

@JsonSerializable()
class LastAppointmentParams {
  final List<int> caretakerIds;
  LastAppointmentParams({
    required this.caretakerIds,
  });

  Map<String, dynamic> toJson() => _$LastAppointmentParamsToJson(this);

  factory LastAppointmentParams.fromJson(Map<String, dynamic> json) =>
      _$LastAppointmentParamsFromJson(json);
}
