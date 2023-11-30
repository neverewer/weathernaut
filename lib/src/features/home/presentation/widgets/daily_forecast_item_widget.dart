import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/domain/entites/day.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/weather_image_widget.dart';

class DailyForecastItemWidget extends StatelessWidget {
  final DayEntity day;

  const DailyForecastItemWidget({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minLeadingWidth: 20,
      titleAlignment: ListTileTitleAlignment.center,
      contentPadding: EdgeInsets.zero,
      leading: WeatherImageWidget(
        imagePath: day.conditionImagePath,
        width: 20,
        height: 20,
      ),
      title: Text(
        day.dayOfWeek,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: TempWidget(
        temp: day.maxTemp.toString(),
        fontSize: 16,
      ),
    );
  }
}
