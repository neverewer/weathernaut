import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';

class HourlyForecastItemWidget extends StatelessWidget {
  final String time;
  final String imagePath;
  final String temp;
  final bool isNow;

  const HourlyForecastItemWidget({
    super.key,
    required this.time,
    required this.imagePath,
    required this.temp,
    required this.isNow,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      backgroundColor: isNow ? Colors.white : null,
      borderRadius: 30,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            isNow ? context.localization.now : time,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0XFF9f978f),
            ),
          ),
          Image.asset(
            imagePath,
            width: 45,
            height: 45,
          ),
          TempWidget(
            temp: temp,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
