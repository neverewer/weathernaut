class HourEntity {
  final String time;
  final int temp;
  final String conditionImageUrl;
  final bool isNow;

  HourEntity({
    required this.isNow,
    required this.time,
    required this.temp,
    required this.conditionImageUrl,
  });
}
