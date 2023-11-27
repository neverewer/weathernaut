// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    WeaklyForecastRoute.name: (routeData) {
      final args = routeData.argsAs<WeaklyForecastRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeaklyForecastScreen(
          weaklyWeatherForecast: args.weaklyWeatherForecast,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeaklyForecastScreen]
class WeaklyForecastRoute extends PageRouteInfo<WeaklyForecastRouteArgs> {
  WeaklyForecastRoute({
    required List<DayEntity> weaklyWeatherForecast,
    List<PageRouteInfo>? children,
  }) : super(
          WeaklyForecastRoute.name,
          args: WeaklyForecastRouteArgs(
            weaklyWeatherForecast: weaklyWeatherForecast,
          ),
          initialChildren: children,
        );

  static const String name = 'WeaklyForecastRoute';

  static const PageInfo<WeaklyForecastRouteArgs> page = PageInfo<WeaklyForecastRouteArgs>(name);
}

class WeaklyForecastRouteArgs {
  const WeaklyForecastRouteArgs({
    required this.weaklyWeatherForecast,
  });

  final List<DayEntity> weaklyWeatherForecast;

  @override
  String toString() {
    return 'WeaklyForecastRouteArgs{weaklyWeatherForecast: $weaklyWeatherForecast}';
  }
}
