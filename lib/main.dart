import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/data/data_sources/local/position_service.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';
import 'package:weathernaut/src/core/data/repositories/position_repository.dart';
import 'package:weathernaut/src/core/data/repositories/weather_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/features/app/app.dart';
import 'package:weathernaut/src/features/dependencies/model/dependencies.dart';

void main() async {
  final router = AppRouter();
  final dependencies = await createDependencies();

  runApp(App(
    router: router,
    dependencies: dependencies,
  ));
}

Future<Dependencies> createDependencies() async {
  final Dio dio = Dio();
  final WeatherApiService weatherApiService = WeatherApiService(dio);
  final WeatherRepository weatherRepository = WeatherRepositoryImpl(weatherApiService: weatherApiService);
  final PositionService positionService = PositionService();
  final PositionRepository positionRepository = PositionRepositoryImp(positionService: positionService);
  final Dependencies dependencies = Dependencies(
    positionRepository: positionRepository,
    weatherRepository: weatherRepository,
  );

  return dependencies;
}
