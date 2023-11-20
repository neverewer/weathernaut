import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherEntity> getCurrentWeatherForecast();
  Future<List<DayEntity>> getWeaklyWeatherForecast();
}
