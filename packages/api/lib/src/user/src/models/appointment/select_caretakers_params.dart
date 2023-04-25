// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'select_caretakers_params.g.dart';

@JsonSerializable()
class SelectCaretakerParams {
  final List<int> caretakerIds;
  final int? appointmentId;
  SelectCaretakerParams({
    required this.caretakerIds,
    this.appointmentId,
  });

  factory SelectCaretakerParams.fromJson(Map<String, dynamic> json) =>
      _$SelectCaretakerParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCaretakerParamsToJson(this);
}
