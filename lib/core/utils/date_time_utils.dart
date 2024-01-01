import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDate({required DateTime date, required String formatType}) {
    try {
      final formatter = DateFormat(formatType);
      return formatter.format(date);
    } catch (e) {
      return '';
    }
  }

  static String formatDateTime(String inputDateString, String outputFormat) {
    try {
      DateTime dateTime = DateTime.parse(inputDateString);
      String formattedDate = DateFormat(outputFormat).format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }
}
