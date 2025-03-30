import 'package:intl/intl.dart';

class AppDateTimeFormat {
  static String timeWithTrailing(DateTime dateTime) =>
      DateFormat.jm().format(dateTime);
}
