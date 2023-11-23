import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/current.dart';
import 'package:weathernaut/src/core/data/models/forecast.dart';
import 'package:weathernaut/src/core/data/models/location.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/utils/constants/strings.dart';

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
      location: '${location.country},\n${location.name}',
      formattedDate: getFormattedDate(location.localtime),
      temp: current.tempC.toInt(),
      conditionText: current.condition.text,
      conditionImagePath: getImagePathFromCode(current.condition.code, current.isDay),
      windSpeed: current.windKph,
      rainfall: current.precipMm ~/ 100,
      humidity: current.humidity,
      hourForecast: forecast.forecastday
          .map((forecastDay) => forecastDay.hour)
          .expand((hourList) => hourList.map((e) => e.toEntity()))
          .toList());

  String getIconPath(String url) {
    final List<String> parts = url.split("/");
    final result = "${parts[parts.length - 2]}/${parts[parts.length - 1]}";
    return result;
  }

  String getImagePathFromCode(int conditionCode, int isDay) {
    String imageName;
    switch (conditionCode) {
      case 1000:
        imageName = '01${getTimesOfDay(isDay)}';
      case 1003:
      case 1006:
      case 1009:
        imageName = '02${getTimesOfDay(isDay)}';
      case 1030:
      case 1035:
      case 1147:
        imageName = '07${getTimesOfDay(isDay)}';
      case 1063:
      case 1072:
      case 1150:
      case 1153:
      case 1168:
      case 1171:
      case 1180:
      case 1183:
      case 1186:
      case 1189:
      case 1192:
      case 1195:
      case 1198:
      case 1201:
      case 1240:
      case 1243:
      case 1246:
        imageName = '03${getTimesOfDay(isDay)}';
      case 1066:
      case 1069:
      case 1114:
      case 1117:
      case 1204:
      case 1207:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
      case 1222:
      case 1225:
      case 1237:
      case 1255:
      case 1258:
        imageName = '04${getTimesOfDay(isDay)}';
      case 1249:
      case 1252:
      case 1261:
      case 1264:
        imageName = '05${getTimesOfDay(isDay)}';
      case 1087:
      case 1273:
      case 1276:
      case 1279:
      case 1282:
        imageName = '06${getTimesOfDay(isDay)}';
      default:
        imageName = '01${getTimesOfDay(isDay)}';
    }
    return '$weatherImagePath$imageName.png';
  }

  String getTimesOfDay(int isDay) => isDay == 1 ? 'd' : 'n';

  String getFormattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    String formattedDate = DateFormat('E, MMM d').format(dateTime);
    return formattedDate;
  }
}
