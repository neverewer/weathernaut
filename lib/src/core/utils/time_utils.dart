sealed class TimeUtils {
  /// Returns the hours of time in string format
  static int getTimeHour(String time) {
    int hour = int.parse(time.split(':')[0]);
    return hour;
  }

  // Get string mark for day or night
  static String getMarkOfDay(int isDay) => isDay == 1 ? 'd' : 'n';
}
