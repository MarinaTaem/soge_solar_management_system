import 'package:intl/intl.dart';

class DatetimeHelper {
  static String formatToday(DateTime date) =>
      DateFormat('yyyy-MM-dd ').format(date);
  static String formatMonth(DateTime date) =>
      DateFormat('yyyy-MM').format(date);
  static String formatYear(DateTime date) => DateFormat('yyyy').format(date);
}
