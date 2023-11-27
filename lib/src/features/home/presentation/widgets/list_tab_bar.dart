import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';

class ListTabBar extends StatelessWidget {
  final List<DayEntity>? weaklyWeatherForecast;

  const ListTabBar({
    super.key,
    this.weaklyWeatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localization.hourlyForecastLabel,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF313341),
          ),
        ),
        InkWell(
          onTap: () {
            if (weaklyWeatherForecast != null) {
              context.router.push(WeaklyForecastRoute(
                weaklyWeatherForecast: weaklyWeatherForecast!,
              ));
            }
          },
          child: Text(
            '${context.localization.next7Days} >',
            style: const TextStyle(
              fontSize: 20,
              color: Color(0XFFd6996b),
            ),
          ),
        ),
      ],
    );
  }
}
