import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDate({
    required DateTime date,
    required String formatType,
  }) {
    try {
      final formatter = DateFormat(formatType);
      return formatter.format(date);
    } catch (e) {
      return '';
    }
  }

  static String formatDateTime({
    required String inputDateString,
    required String outputFormat,
  }) {
    try {
      DateTime dateTime = DateTime.parse(inputDateString);
      String formattedDate = DateFormat(outputFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getCurrentDate({
    required String outputFormat,
  }) {
    try {
      DateTime dateTime = DateTime.now();
      String formattedDate = DateFormat(outputFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getFormattedTime(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }
}
