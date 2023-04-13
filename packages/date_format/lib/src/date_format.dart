import 'package:intl/intl.dart';

class MyDateFormat {
  static String formatDate(DateTime? date, {String format = 'dd/MM/yyyy'}) {
    return date == null ? '' : DateFormat(format).format(date);
  }

  static String formatDateYYYYMMDD(DateTime? date) {
    return date == null ? '' : DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatTimeHHMM(DateTime? date) {
    return date == null ? '' : DateFormat('hh:mm').format(date);
  }

  static String formatTime(DateTime? date) {
    return date == null ? '' : DateFormat('hh:mm:ss a').format(date);
  }

  static String formatDateInYMMMED(DateTime? date) {
    return date == null ? '' : DateFormat.yMMMEd().format(date);
  }

  static String formatDateWithTime(DateTime? dateTime) {
    return '${formatDate(dateTime)}  ${formatTime(dateTime)}';
  }

  static parseDate(String? date) {
    if (date == null) return null;
    return DateTime.tryParse(date)?.toLocal();
  }
}
