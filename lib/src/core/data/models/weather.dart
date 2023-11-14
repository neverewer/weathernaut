import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/domain/entites/weather.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: "location")
  final LocationModel location;
  @JsonKey(name: "current")
  final CurrentModel current;
  @JsonKey(name: "forecast")
  final ForecastModel forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() => WeatherEntity(
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

@JsonSerializable()
class ConditionModel {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "icon")
  final String icon;
  @JsonKey(name: "code")
  final int code;

  ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: "forecastday")
  final List<ForecastdayModel> forecastday;

  ForecastModel({
    required this.forecastday,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}

@JsonSerializable()
class ForecastdayModel {
  @JsonKey(name: "date")
  final DateTime date;
  @JsonKey(name: "date_epoch")
  final int dateEpoch;
  @JsonKey(name: "day")
  final DayModel day;
  @JsonKey(name: "astro")
  final AstroModel astro;
  @JsonKey(name: "hour")
  final List<HourModel> hour;

  ForecastdayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) => _$ForecastdayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayModelToJson(this);
}

@JsonSerializable()
class AstroModel {
  @JsonKey(name: "sunrise")
  final String sunrise;
  @JsonKey(name: "sunset")
  final String sunset;
  @JsonKey(name: "moonrise")
  final String moonrise;
  @JsonKey(name: "moonset")
  final String moonset;
  @JsonKey(name: "moon_phase")
  final String moonPhase;
  @JsonKey(name: "moon_illumination")
  final int moonIllumination;
  @JsonKey(name: "is_moon_up")
  final int isMoonUp;
  @JsonKey(name: "is_sun_up")
  final int isSunUp;

  AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory AstroModel.fromJson(Map<String, dynamic> json) => _$AstroModelFromJson(json);

  Map<String, dynamic> toJson() => _$AstroModelToJson(this);
}

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
}

@JsonSerializable()
class HourModel {
  @JsonKey(name: "time_epoch")
  final int timeEpoch;
  @JsonKey(name: "time")
  final String time;
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
  @JsonKey(name: "windchill_c")
  final double windchillC;
  @JsonKey(name: "windchill_f")
  final double windchillF;
  @JsonKey(name: "heatindex_c")
  final double heatindexC;
  @JsonKey(name: "heatindex_f")
  final double heatindexF;
  @JsonKey(name: "dewpoint_c")
  final double dewpointC;
  @JsonKey(name: "dewpoint_f")
  final double dewpointF;
  @JsonKey(name: "will_it_rain")
  final int willItRain;
  @JsonKey(name: "chance_of_rain")
  final int chanceOfRain;
  @JsonKey(name: "will_it_snow")
  final int willItSnow;
  @JsonKey(name: "chance_of_snow")
  final int chanceOfSnow;
  @JsonKey(name: "vis_km")
  final double visKm;
  @JsonKey(name: "vis_miles")
  final double visMiles;
  @JsonKey(name: "gust_mph")
  final double gustMph;
  @JsonKey(name: "gust_kph")
  final double gustKph;
  @JsonKey(name: "uv")
  final double uv;

  HourModel({
    required this.timeEpoch,
    required this.time,
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
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => _$HourModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourModelToJson(this);

  HourEntity toEntity() => HourEntity(time: time, temp: tempF, conditionImageUrl: condition.icon);
}

@JsonSerializable()
class LocationModel {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "tz_id")
  final String tzId;
  @JsonKey(name: "localtime_epoch")
  final int localtimeEpoch;
  @JsonKey(name: "localtime")
  final String localtime;

  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
