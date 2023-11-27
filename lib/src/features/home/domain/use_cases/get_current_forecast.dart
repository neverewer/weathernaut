import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';

class GetCurrentForecastUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentForecastUseCase({required this.weatherRepository});

  Future<CurrentWeatherEntity?> call(String location) async {
    try {
      //await Geolocator.requestPermission();
      final currentWeather = await weatherRepository.getCurrentWeatherForecast(location);
      return currentWeather;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
