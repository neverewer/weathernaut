import 'package:weathernaut/src/core/domain/entites/day.dart';

class WeaklyWeatherEntity {
  final List<DayEntity> dailyForecast;

  WeaklyWeatherEntity({
    required this.dailyForecast,
  });
}
