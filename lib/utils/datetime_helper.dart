import 'package:intl/intl.dart';

class DatetimeHelper {
  static String formatToday(DateTime date) =>
      DateFormat('dd-MM-yyyy').format(date);
  static String formatMonth(DateTime date) =>
      DateFormat('MM-yyyy').format(date);
  static String formatYear(DateTime date) => DateFormat('yyyy').format(date);
}
