import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/presentation/widgets/base_screen.dart';
import 'package:weathernaut/src/features/weakly_forecast/presentation/widgets/weakly_forecast_item_widget.dart';

@RoutePage()
class WeaklyForecastScreen extends BaseScreen {
  final List<DayEntity> weaklyWeatherForecast;

  const WeaklyForecastScreen({
    super.key,
    required this.weaklyWeatherForecast,
  });

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'Next 7 Days',
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: weaklyWeatherForecast.map((e) => WeaklyForecastItemWidget(day: e)).toList(),
          ),
        ),
      ),
    );
  }
}
