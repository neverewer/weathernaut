import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/condition.dart';

part 'current.g.dart';

@JsonSerializable()
class CurrentModel {
  @JsonKey(name: "last_updated_epoch")
  final int lastUpdatedEpoch;
  @JsonKey(name: "last_updated")
  final String lastUpdated;
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "temp_f")
  final double tempF;
  @JsonKey(name: "is_day")
  final int isDay;
  @JsonKey(name: "condition")
  final ConditionModel condition;
  @JsonKey(name: "wind_mph")
  final double windMph;
  @JsonKey(name: "wind_kph")
  final double windKph;
  @JsonKey(name: "wind_degree")
  final int windDegree;
  @JsonKey(name: "wind_dir")
  final String windDir;
  @JsonKey(name: "pressure_mb")
  final double pressureMb;
  @JsonKey(name: "pressure_in")
  final double pressureIn;
  @JsonKey(name: "precip_mm")
  final double precipMm;
  @JsonKey(name: "precip_in")
  final double precipIn;
  @JsonKey(name: "humidity")
  final int humidity;
  @JsonKey(name: "cloud")
  final int cloud;
  @JsonKey(name: "feelslike_c")
  final double feelslikeC;
  @JsonKey(name: "feelslike_f")
  final double feelslikeF;
  @JsonKey(name: "vis_km")
  final double visKm;
  @JsonKey(name: "vis_miles")
  final double visMiles;
  @JsonKey(name: "uv")
  final double uv;
  @JsonKey(name: "gust_mph")
  final double gustMph;
  @JsonKey(name: "gust_kph")
  final double gustKph;

  CurrentModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => _$CurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}
