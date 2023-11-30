import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';

class HourlyForecastLabel extends StatelessWidget {
  const HourlyForecastLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        context.localization.hourlyForecastLabel,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
