import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/daily_forecast_item_widget.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<DayEntity> dailyWeatherForecast;

  const DailyForecastWidget({
    super.key,
    required this.dailyWeatherForecast,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
        contentPadding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localization.dailyForecastLabel,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            ...dailyWeatherForecast.map((e) => DailyForecastItemWidget(day: e)).toList(),
          ],
        ));
  }
}
