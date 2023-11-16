import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/forecast_day.dart';

part 'forecast.g.dart';

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
