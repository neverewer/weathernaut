class DayEntity {
  final String dayOfWeek;
  final double maxTemp;
  final double maxWindSpeed;
  final String conditionImagePath;
  final int humidity;
  final int rainfall;

  DayEntity({
    required this.dayOfWeek,
    required this.maxTemp,
    required this.maxWindSpeed,
    required this.humidity,
    required this.rainfall,
    required this.conditionImagePath,
  });
}
