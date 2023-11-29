import 'dart:io';

import 'package:intl/intl.dart';
import 'package:weathernaut/src/core/utils/extensions/string_extension.dart';

extension DateTimeExtension on DateTime {
  // Get the day of week from date time
  //Example : 2023-01-01 00:00:00.000 => Sunday
  String getStringDayOfWeek() {
    try {
      return DateFormat('EEEE', Platform.localeName).format(this).capitalize();
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
