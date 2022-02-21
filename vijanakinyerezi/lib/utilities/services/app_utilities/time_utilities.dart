import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtilities {
  static String dateFormatter(BuildContext context, String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  ///acceptable api date mode
  static String localeDateFormatter(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String initialDate() {
    return localeDateFormatter(DateTime(2016, 1, 1));
  }

  static String endingDate() {
    return "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  }

  static double minuteConverter(int seconds) {
    return seconds / 60;
  }

  static double hourConverter(int seconds) {
    return seconds / 3600;
  }
}
