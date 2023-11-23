import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';

class Dependencies {
  final PositionRepository positionRepository;
  final WeatherRepository weatherRepository;

  Dependencies({
    required this.positionRepository,
    required this.weatherRepository,
  });
}
