import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';
import 'package:weathernaut/src/core/data/models/current_weather.dart';
import 'package:weathernaut/src/core/data/models/daily_weather.dart';
import 'package:weathernaut/src/core/utils/constants/strings.dart';

import 'current_weather_map.dart';
import 'weakly_weather_map.dart';

@GenerateNiceMocks([MockSpec<WeatherApiService>()])
import 'weather_api_service_test.mocks.dart';

void main() {
  final mockWeatherApiService = MockWeatherApiService();

  group('WeatherApiService', () {
    test('getCurrentWeatherForecastFromLocation', () async {
      final response = HttpResponse<CurrentWeatherModel>(
        CurrentWeatherModel.fromJson(currentWeatherMap),
        Response<dynamic>(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      const key = weatherApiKey;
      const q = 'Hrodna';
      const days = 1;
      const tp = 15;
      const lang = null;

      when(mockWeatherApiService.getCurrentWeatherForecastFromLocation(
        key: key,
        q: q,
        days: days,
        tp: tp,
        lang: lang,
      )).thenAnswer((_) async => response);

      final result = await mockWeatherApiService.getCurrentWeatherForecastFromLocation(
        key: key,
        q: q,
        days: days,
        tp: tp,
        lang: lang,
      );

      expect(result, response);
    });

    test('getWeaklyWeatherForecastFromLocation', () async {
      final response = HttpResponse<DailyWeatherModel>(
        DailyWeatherModel.fromJson(weaklyWeatherMap),
        Response<dynamic>(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      const key = weatherApiKey;
      const q = 'Hrodna';
      const days = 3;
      const hour = 24;
      const lang = null;

      when(mockWeatherApiService.getDailyWeatherForecastFromLocation(
        key: key,
        q: q,
        days: days,
        hour: hour,
        lang: lang,
      )).thenAnswer((_) async => response);

      final result = await mockWeatherApiService.getDailyWeatherForecastFromLocation(
        key: key,
        q: q,
        days: days,
        hour: hour,
        lang: lang,
      );

      expect(result, response);
    });
  });
}
