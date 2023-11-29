import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/current.dart';
import 'package:weathernaut/src/core/data/models/forecast.dart';
import 'package:weathernaut/src/core/data/models/location.dart';

part 'daily_weather.g.dart';

@JsonSerializable()
class DailyWeatherModel {
  @JsonKey(name: "location")
  final LocationModel location;
  @JsonKey(name: "current")
  final CurrentModel current;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  DailyWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) => _$DailyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);
}
