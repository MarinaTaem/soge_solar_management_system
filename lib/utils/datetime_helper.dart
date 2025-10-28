import 'package:intl/intl.dart';

class DatetimeHelper {
  static String formatDateEng(DateTime date) =>
      DateFormat('d MMM yyyy').format(date);
  static String formatDayTime(DateTime date) =>
      DateFormat('yyyy-MM-dd hh:mm').format(date);
  static String formatDay(DateTime date) =>
      DateFormat('yyyy-MM-dd ').format(date);
  static String formatMonth(DateTime date) =>
      DateFormat('yyyy-MM').format(date);
  static String formatYear(DateTime date) => DateFormat('yyyy').format(date);
}
