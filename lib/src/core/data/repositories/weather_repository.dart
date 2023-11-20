import 'package:dio/dio.dart';
import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl({
    required this.weatherApiService,
  });

  @override
  Future<CurrentWeatherEntity> getCurrentWeatherForecast(String location) async {
    try {
      var response = await weatherApiService.getCurrentWeatherForecastFromLocation(
        key: weatherApiKey,
        q: location,
        days: 1,
        tp: 15,
        lang: null,
      );

      if (response.response.statusCode != 200) {
        throw Exception();
      }

      var currentWeather = response.data.toEntity();

      return currentWeather;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<DayEntity>> getWeaklyWeatherForecast(String location) async {
    try {
      var response = await weatherApiService.getWeaklyWeatherForecastFromLocation(
        key: weatherApiKey,
        q: location,
        days: 8,
        hour: 24,
        lang: null,
      );

      if (response.response.statusCode != 200) {
        throw Exception();
      }

      var weaklyWeatherForecast = response.data.forecast.forecastday.map((e) => e.day.toEntity()).toList();

      return weaklyWeatherForecast;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
