import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';
import 'package:weathernaut/src/core/utils/constants/strings.dart';
import 'package:weathernaut/src/core/utils/exceptions/network_exceptions.dart';
import 'package:weathernaut/src/core/utils/extensions/string_extension.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepositoryImpl({
    required this.weatherApiService,
  });

  @override
  Future<CurrentWeatherEntity?> getCurrentWeatherForecast(String location) async {
    try {
      var response = await weatherApiService.getCurrentWeatherForecastFromLocation(
        key: weatherApiKey,
        q: location,
        days: 1,
        tp: 15,
        lang: Platform.localeName.getShortLocaleName(),
      );

      var currentWeather = response.data.toEntity();

      return currentWeather;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(
          ConnectionException(
            message: 'ConnectionException: $e',
            statusCode: e.response?.statusCode,
          ),
          e.stackTrace,
        );
      }
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(
        RemoteDataSourceException(message: e.toString()),
        stackTrace,
      );
    }
    return null;
  }

  @override
  Future<List<DayEntity>?> getWeaklyWeatherForecast(String location) async {
    try {
      var response = await weatherApiService.getWeaklyWeatherForecastFromLocation(
        key: weatherApiKey,
        q: location,
        days: 8,
        hour: 24,
        lang: Platform.localeName.getShortLocaleName(),
      );

      var weaklyWeatherForecast = response.data.forecast.forecastday.map((e) => e.day.toEntity(e.date)).toList();

      return weaklyWeatherForecast;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(
          ConnectionException(
            message: 'ConnectionException: $e',
            statusCode: e.response?.statusCode,
          ),
          e.stackTrace,
        );
      }
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(
        RemoteDataSourceException(message: e.toString()),
        stackTrace,
      );
    }
    return null;
  }
}
