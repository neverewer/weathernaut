import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';

class GetWeaklyForecastUseCase {
  final WeatherRepository weatherRepository;

  GetWeaklyForecastUseCase({required this.weatherRepository});

  Future<List<DayEntity>?> call(String location) async {
    try {
      final weaklyForecast = await weatherRepository.getDailyWeatherForecast(location);
      return weaklyForecast;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
