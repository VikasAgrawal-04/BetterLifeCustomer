enum AppointmentType { present, past, future }

extension AppointmentTypeExt on AppointmentType {
  bool get isPresent => this == AppointmentType.present;
  bool get isPast => this == AppointmentType.past;
  bool get isFuture => this == AppointmentType.future;
}
