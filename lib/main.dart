import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:l/l.dart';
import 'package:weathernaut/src/core/data/data_sources/local/position_service.dart';
import 'package:weathernaut/src/core/data/data_sources/remote/weather_api_service.dart';
import 'package:weathernaut/src/core/data/repositories/position_repository.dart';
import 'package:weathernaut/src/core/data/repositories/weather_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/core/utils/logger_utils.dart';
import 'package:weathernaut/src/features/app/app.dart';
import 'package:weathernaut/src/features/dependencies/model/dependencies.dart';

void main() => l.capture<void>(
      () => runZonedGuarded<void>(
        () async {
          var bindings = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

          FlutterNativeSplash.preserve(widgetsBinding: bindings);
          bindings.addPostFrameCallback((timeStamp) {
            bindings.allowFirstFrame();
          });
          //set orientation
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);

          //set status bar color
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          );

          final router = AppRouter();
          final dependencies = await createDependencies();
          await Geolocator.requestPermission();
          runApp(
            App(
              router: router,
              dependencies: dependencies,
            ),
          );
          FlutterNativeSplash.remove();
        },
        l.e,
      ),
      const LogOptions(
        handlePrint: true,
        messageFormatting: LoggerUtils.messageFormatting,
        outputInRelease: false,
        printColors: true,
      ),
    );

Future<Dependencies> createDependencies() async {
  final Dio dio = Dio();
  final WeatherApiService weatherApiService = WeatherApiService(dio);
  final WeatherRepository weatherRepository = WeatherRepositoryImpl(weatherApiService: weatherApiService);
  final PositionService positionService = PositionService();
  final PositionRepository positionRepository = PositionRepositoryImpl(positionService: positionService);
  final Dependencies dependencies = Dependencies(
    positionRepository: positionRepository,
    weatherRepository: weatherRepository,
  );

  return dependencies;
}
