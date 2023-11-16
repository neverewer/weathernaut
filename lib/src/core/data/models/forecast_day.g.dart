// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastdayModel _$ForecastdayModelFromJson(Map<String, dynamic> json) =>
    ForecastdayModel(
      date: DateTime.parse(json['date'] as String),
      dateEpoch: json['date_epoch'] as int,
      day: DayModel.fromJson(json['day'] as Map<String, dynamic>),
      astro: AstroModel.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>)
          .map((e) => HourModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayModelToJson(ForecastdayModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'date_epoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };
