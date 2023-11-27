import 'dart:io';

import 'package:intl/intl.dart';

extension StringExtension on String {
  // Get the formatted date from string  date
  //Example: 2023-01-01 00:00:00.000 => Sun, Jan 1
  String getFormattedDateString() {
    DateTime dateTime = DateTime.parse(this);
    String formattedDate = DateFormat('E, MMM d', Platform.localeName).format(dateTime);
    return formattedDate;
  }

  // Get the formatted time from string date
  //Example: 2023-01-01 00:00:00.000 => 00:00
  String getFormattedTimeString() {
    DateTime dateTime = DateTime.parse(this);
    String formattedTime = DateFormat('H:mm').format(dateTime);
    return formattedTime;
  }

  String getShortLocaleName() {
    return substring(0, 2);
  }
}
