import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/src/core/domain/repositories/position_repository.dart';
import 'package:weathernaut/src/core/domain/repositories/weather_repository.dart';
import 'package:weathernaut/src/features/home/domain/use_cases/get_current_weather.dart';
import 'package:weathernaut/src/features/home/domain/use_cases/get_position.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_event.dart';
import 'package:weathernaut/src/features/home/presentation/bloc/home_state.dart';

/// Business Logic Component HomeBLoC
class HomeBLoC extends Bloc<HomeEvent, HomeState> implements EventSink<HomeEvent> {
  HomeBLoC({
    required final WeatherRepository weatherRepository,
    required final PositionRepository positionRepository,
    final HomeState? initialState,
  })  : _weatherRepository = weatherRepository,
        _positionRepository = positionRepository,
        super(
          initialState ??
              const HomeState.idle(
                data: null,
                message: 'Initial idle state',
              ),
        ) {
    on<HomeEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
      transformer: bloc_concurrency.sequential(),
      //transformer: bloc_concurrency.restartable(),
      //transformer: bloc_concurrency.droppable(),
      //transformer: bloc_concurrency.concurrent(),
    );
  }

  final WeatherRepository _weatherRepository;
  final PositionRepository _positionRepository;

  /// Fetch event handler
  Future<void> _fetch(HomeEvent$Fetch event, Emitter<HomeState> emit) async {
    try {
      emit(HomeState.processing(data: state.data));
      final position = await GetPositionUseCase(positionRepository: _positionRepository).call();
      final currentWeather =
          await GetCurrentWeatherUseCase(weatherRepository: _weatherRepository).call('${position.lat},${position.lon}');

      emit(HomeState.successful(data: currentWeather));
    } on Object catch (err, stackTrace) {
      emit(HomeState.error(data: state.data));
      rethrow;
    }
  }
}
