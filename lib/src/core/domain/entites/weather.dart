class WeatherEntity {
  final String location;
  final DateTime date;
  final double temp;
  final String conditionText;
  final String conditionImageUrl;
  final double windSpeed;
  final int rainfall;
  final int humidity;
  final List<HourEntity> hourForecast;

  WeatherEntity({
    required this.location,
    required this.date,
    required this.temp,
    required this.conditionText,
    required this.conditionImageUrl,
    required this.windSpeed,
    required this.rainfall,
    required this.humidity,
    required this.hourForecast,
  });
}

class HourEntity {
  final String time;
  final double temp;
  final String conditionImageUrl;

  HourEntity({
    required this.time,
    required this.temp,
    required this.conditionImageUrl,
  });
}
