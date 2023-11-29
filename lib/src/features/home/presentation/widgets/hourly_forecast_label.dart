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
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF313341),
        ),
      ),
    );
  }
}
