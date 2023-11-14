import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';

void main() {
  test('Return response from get', () async {
    final dio = Dio();
    final apiService = WeatherApiService(dio);
    final result =
        await apiService.getWeatherForecastFromLocation(key: weatherApiKey, q: 'Hrodna', days: 1, tp: 15, lang: null);
    expect(result.response.statusCode, HttpStatus.ok);
  });
}
