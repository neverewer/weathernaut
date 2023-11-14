import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/data/models/weather.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherApiBaseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/forecast.json')
  Future<HttpResponse<WeatherModel>> getWeatherForecastFromLocation({
    @Query('key') required String? key,
    @Query('q') required String? q,
    @Query('days') required int? days,
    @Query('tp') required int? tp,
    @Query('lang') required String? lang,
  });
}
