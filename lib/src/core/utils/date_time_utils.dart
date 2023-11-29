import 'dart:io';

import 'package:intl/intl.dart';
import 'package:weathernaut/src/core/utils/extensions/string_extension.dart';

sealed class DateTimeUtils {
  /// Returns the hours of time in string format
  static int getTimeHour(String time) {
    try {
      int hour = int.parse(time.split(':')[0]);
      return hour;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }

  // Get string mark for day or night
  static String getMarkOfDay(int isDay) => isDay == 1 ? 'd' : 'n';

  // Get the formatted date from string  date
  //Example: 2023-01-01 00:00:00.000 => Sun, Jan 1
  static String getFormattedDateString(String input) {
    try {
      DateFormat format = DateFormat("yyyy-MM-dd HH:mm");
      DateTime dateTime = format.parse(input);
      String formattedDate = DateFormat('E, MMM d', Platform.localeName).format(dateTime);
      return formattedDate.capitalize();
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }

  // Get the formatted time from string date
  //Example: 2023-01-01 00:00:00.000 => 00:00
  static String getFormattedTimeString(String input) {
    try {
      DateFormat format = DateFormat("yyyy-MM-dd HH:mm");
      DateTime dateTime = format.parse(input);
      String formattedTime = DateFormat('H:mm').format(dateTime);
      return formattedTime;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
