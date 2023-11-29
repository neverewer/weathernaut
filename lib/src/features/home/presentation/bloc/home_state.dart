import 'package:meta/meta.dart';
import 'package:weathernaut/src/core/domain/entites/current_weather.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';

/// {@template home_state_placeholder}
/// Entity placeholder for HomeState
/// {@endtemplate}

/// {@template home_state}
/// HomeState.
/// {@endtemplate}
sealed class HomeState extends _$HomeStateBase {
  /// Idling state
  /// {@macro home_state}
  const factory HomeState.idle({
    required CurrentWeatherEntity? currentWeatherForecast,
    required List<DayEntity>? dailyWeatherForecast,
    String message,
  }) = HomeState$Idle;

  /// Processing
  /// {@macro home_state}
  const factory HomeState.processing({
    required CurrentWeatherEntity? currentWeatherForecast,
    required List<DayEntity>? dailyWeatherForecast,
    String message,
  }) = HomeState$Processing;

  /// Successful
  /// {@macro home_state}
  const factory HomeState.successful({
    required CurrentWeatherEntity? currentWeatherForecast,
    required List<DayEntity>? dailyWeatherForecast,
    String message,
  }) = HomeState$Successful;

  /// An error has occurred
  /// {@macro home_state}
  const factory HomeState.error({
    required CurrentWeatherEntity? currentWeatherForecast,
    required List<DayEntity>? dailyWeatherForecast,
    String message,
    required Object error,
  }) = HomeState$Error;

  /// {@macro home_state}
  const HomeState({required super.currentWeatherForecast, required super.dailyWeatherForecast, required super.message});
}

/// Idling state
/// {@nodoc}
final class HomeState$Idle extends HomeState with _$HomeState {
  /// {@nodoc}
  const HomeState$Idle(
      {required super.currentWeatherForecast, required super.dailyWeatherForecast, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class HomeState$Processing extends HomeState with _$HomeState {
  /// {@nodoc}
  const HomeState$Processing(
      {required super.currentWeatherForecast, required super.dailyWeatherForecast, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class HomeState$Successful extends HomeState with _$HomeState {
  /// {@nodoc}
  const HomeState$Successful(
      {required super.currentWeatherForecast, required super.dailyWeatherForecast, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class HomeState$Error extends HomeState with _$HomeState {
  /// {@nodoc}
  final Object error;
  const HomeState$Error(
      {required super.currentWeatherForecast,
      required super.dailyWeatherForecast,
      super.message = 'An error has occurred.',
      required this.error});
}

/// {@nodoc}
base mixin _$HomeState on HomeState {}

/// Pattern matching for [HomeState].
typedef HomeStateMatch<R, S extends HomeState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$HomeStateBase {
  /// {@nodoc}
  const _$HomeStateBase({
    required this.currentWeatherForecast,
    required this.dailyWeatherForecast,
    required this.message,
  });

  /// Data entity payload.
  @nonVirtual
  final CurrentWeatherEntity? currentWeatherForecast;

  @nonVirtual
  final List<DayEntity>? dailyWeatherForecast;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has current weather forecast?
  bool get hasCurrentWeatherForecast => currentWeatherForecast != null;

  /// Has weakly weather forecast?
  bool get hasDailyWeatherForecast => dailyWeatherForecast != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [HomeState].
  R map<R>({
    required HomeStateMatch<R, HomeState$Idle> idle,
    required HomeStateMatch<R, HomeState$Processing> processing,
    required HomeStateMatch<R, HomeState$Successful> successful,
    required HomeStateMatch<R, HomeState$Error> error,
  }) =>
      switch (this) {
        HomeState$Idle s => idle(s),
        HomeState$Processing s => processing(s),
        HomeState$Successful s => successful(s),
        HomeState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [HomeState].
  R maybeMap<R>({
    HomeStateMatch<R, HomeState$Idle>? idle,
    HomeStateMatch<R, HomeState$Processing>? processing,
    HomeStateMatch<R, HomeState$Successful>? successful,
    HomeStateMatch<R, HomeState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [HomeState].
  R? mapOrNull<R>({
    HomeStateMatch<R, HomeState$Idle>? idle,
    HomeStateMatch<R, HomeState$Processing>? processing,
    HomeStateMatch<R, HomeState$Successful>? successful,
    HomeStateMatch<R, HomeState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => currentWeatherForecast.hashCode ^ dailyWeatherForecast.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
