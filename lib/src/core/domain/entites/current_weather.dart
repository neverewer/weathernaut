import 'package:weathernaut/src/core/domain/entites/hour.dart';

class CurrentWeatherEntity {
  final String location;
  final String formattedDate;
  final int temp;
  final String conditionText;
  final String conditionImagePath;
  final double windSpeed;
  final int rainfall;
  final int humidity;
  final List<HourEntity> hourForecast;

  CurrentWeatherEntity({
    required this.location,
    required this.formattedDate,
    required this.temp,
    required this.conditionText,
    required this.conditionImagePath,
    required this.windSpeed,
    required this.rainfall,
    required this.humidity,
    required this.hourForecast,
  });
}
