
import 'package:intl/intl.dart';

class TimeUtilities {
  static String dateFormatter(String date) {
    var newdate = date.substring(0, 10);
    return newdate;
  }

  static String dateTimeFormatter(String date) {
    var newdate = date.substring(0, 10) + ' ' + date.substring(11, 23);
    return newdate;
  }

  static String dateBeutify(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat("EEE, d MMM yyyy HH:mm:ss").format(dt);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
