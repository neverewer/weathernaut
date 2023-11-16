import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/data/models/current.dart';
import 'package:weathernaut/src/core/data/models/forecast.dart';
import 'package:weathernaut/src/core/data/models/location.dart';

part 'weakly_weather.g.dart';

@JsonSerializable()
class WeaklyWeatherModel {
  @JsonKey(name: "location")
  final LocationModel location;
  @JsonKey(name: "current")
  final CurrentModel current;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  WeaklyWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeaklyWeatherModel.fromJson(Map<String, dynamic> json) => _$WeaklyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeaklyWeatherModelToJson(this);
}
