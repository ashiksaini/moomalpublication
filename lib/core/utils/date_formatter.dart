import 'package:intl/intl.dart';

class DateFormatter {
  static String formatdate({required DateTime date, required String formatType}) {
    try {
      final formatter = DateFormat(formatType);
      return formatter.format(date);
    } catch (e) {
      print('Error formatting date: $e');
      return ''; 
    }
  }
}
