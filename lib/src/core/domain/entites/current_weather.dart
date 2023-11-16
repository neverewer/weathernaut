import 'package:weathernaut/src/core/domain/entites/hour.dart';

class CurrentWeatherEntity {
  final String location;
  final DateTime date;
  final double temp;
  final String conditionText;
  final String conditionImageUrl;
  final double windSpeed;
  final int rainfall;
  final int humidity;
  final List<HourEntity> hourForecast;

  CurrentWeatherEntity({
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
