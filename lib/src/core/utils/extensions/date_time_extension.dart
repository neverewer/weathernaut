import 'dart:io';

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  // Get the day of week from date time
  //Example : 2023-01-01 00:00:00.000 => Sunday
  String getStringDayOfWeek() {
    return DateFormat('EEEE', Platform.localeName).format(this);
  }
}
