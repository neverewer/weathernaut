import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_image_widget.dart';

class WeaklyForecastItemWidget extends StatelessWidget {
  final DayEntity day;

  const WeaklyForecastItemWidget({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15, right: 35),
        title: Text(day.dayOfWeek),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TempWidget(
              temp: day.maxTemp.toString(),
              fontSize: 16,
            ),
            WeatherImageWidget(
              imagePath: day.conditionImagePath,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
