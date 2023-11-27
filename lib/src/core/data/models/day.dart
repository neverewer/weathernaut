import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/condition.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/utils/extensions/date_time_extension.dart';
import 'package:weathernaut/src/core/utils/image_utils.dart';

part 'day.g.dart';

@JsonSerializable()
class DayModel {
  @JsonKey(name: "maxtemp_c")
  final double maxtempC;
  @JsonKey(name: "maxtemp_f")
  final double maxtempF;
  @JsonKey(name: "mintemp_c")
  final double mintempC;
  @JsonKey(name: "mintemp_f")
  final double mintempF;
  @JsonKey(name: "avgtemp_c")
  final double avgtempC;
  @JsonKey(name: "avgtemp_f")
  final double avgtempF;
  @JsonKey(name: "maxwind_mph")
  final double maxwindMph;
  @JsonKey(name: "maxwind_kph")
  final double maxwindKph;
  @JsonKey(name: "totalprecip_mm")
  final double totalprecipMm;
  @JsonKey(name: "totalprecip_in")
  final double totalprecipIn;
  @JsonKey(name: "totalsnow_cm")
  final double totalsnowCm;
  @JsonKey(name: "avgvis_km")
  final double avgvisKm;
  @JsonKey(name: "avgvis_miles")
  final double avgvisMiles;
  @JsonKey(name: "avghumidity")
  final double avghumidity;
  @JsonKey(name: "daily_will_it_rain")
  final int dailyWillItRain;
  @JsonKey(name: "daily_chance_of_rain")
  final int dailyChanceOfRain;
  @JsonKey(name: "daily_will_it_snow")
  final int dailyWillItSnow;
  @JsonKey(name: "daily_chance_of_snow")
  final int dailyChanceOfSnow;
  @JsonKey(name: "condition")
  final ConditionModel condition;
  @JsonKey(name: "uv")
  final double uv;

  DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => _$DayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayModelToJson(this);

  DayEntity toEntity(DateTime date) => DayEntity(
      dayOfWeek: date.getStringDayOfWeek(),
      maxTemp: maxtempC,
      maxWindSpeed: maxwindKph,
      humidity: avghumidity.toInt(),
      rainfall: totalprecipMm ~/ 100,
      conditionImagePath: ImageUtils.getImagePathFromCode(conditionCode: condition.code));
}
