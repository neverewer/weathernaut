import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/current.dart';
import 'package:weathernaut/src/core/data/models/forecast.dart';
import 'package:weathernaut/src/core/data/models/location.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeatherModel {
  @JsonKey(name: "location")
  final LocationModel location;
  @JsonKey(name: "current")
  final CurrentModel current;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  CurrentWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);

  CurrentWeatherEntity toEntity() => CurrentWeatherEntity(
      location: '${location.country}/n${location.name}',
      date: DateTime.parse(location.localtime),
      temp: current.tempC,
      conditionText: current.condition.text,
      conditionImageUrl: current.condition.icon,
      windSpeed: current.windKph,
      rainfall: current.precipMm ~/ 100,
      humidity: current.humidity,
      hourForecast: forecast.forecastday
          .map((forecastDay) => forecastDay.hour)
          .expand((hourList) => hourList.map((e) => e.toEntity()))
          .toList());
}
