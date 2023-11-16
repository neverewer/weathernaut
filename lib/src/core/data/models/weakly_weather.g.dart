// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weakly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaklyWeatherModel _$WeaklyWeatherModelFromJson(Map<String, dynamic> json) =>
    WeaklyWeatherModel(
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
      forecast:
          ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeaklyWeatherModelToJson(WeaklyWeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
