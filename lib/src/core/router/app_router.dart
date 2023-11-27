import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/src/features/home/presentation/home_screen.dart';
import 'package:weathernaut/src/features/weakly_forecast/presentation/weakly_forecast_screen.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: WeaklyForecastRoute.page, path: '/weaklyForecast'),
      ];
}
