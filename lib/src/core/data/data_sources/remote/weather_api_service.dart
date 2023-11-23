import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weathernaut/src/core/data/models/current_weather.dart';
import 'package:weathernaut/src/core/data/models/weakly_weather.dart';
import 'package:weathernaut/src/core/utils/constants/strings.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherApiBaseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/forecast.json')
  Future<HttpResponse<CurrentWeatherModel>> getCurrentWeatherForecastFromLocation({
    @Query('key') required String? key,
    @Query('q') required String? q,
    @Query('days') required int? days,
    @Query('tp') required int? tp,
    @Query('lang') required String? lang,
  });

  @GET('/forecast.json')
  Future<HttpResponse<WeaklyWeatherModel>> getWeaklyWeatherForecastFromLocation({
    @Query('key') required String? key,
    @Query('q') required String? q,
    @Query('days') required int? days,
    @Query('hour') required int? hour,
    @Query('lang') required String? lang,
  });
}
