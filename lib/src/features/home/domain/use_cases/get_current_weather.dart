import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase({required this.weatherRepository});

  Future<CurrentWeatherEntity> call(String location) async {
    final currentWeather = await weatherRepository.getCurrentWeatherForecast(location);
    return currentWeather;
  }
}
