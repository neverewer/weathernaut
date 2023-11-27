import 'dart:async';

import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherEntity?> getCurrentWeatherForecast(String location);
  Future<List<DayEntity>?> getWeaklyWeatherForecast(String location);
}
