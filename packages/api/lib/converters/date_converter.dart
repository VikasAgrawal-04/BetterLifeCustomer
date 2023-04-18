import 'package:json_annotation/json_annotation.dart';

class DateConverter implements JsonConverter<DateTime?, String?> {
  const DateConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    return DateTime.parse(json).toLocal();
  }

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}
