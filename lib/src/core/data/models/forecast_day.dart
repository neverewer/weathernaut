import 'package:json_annotation/json_annotation.dart';
import 'package:weathernaut/src/core/data/models/astro.dart';
import 'package:weathernaut/src/core/data/models/day.dart';
import 'package:weathernaut/src/core/data/models/hour.dart';

part 'forecast_day.g.dart';

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
