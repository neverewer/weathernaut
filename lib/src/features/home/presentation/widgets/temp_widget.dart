import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  final String temp;
  final double? fontSize;

  const TempWidget({
    super.key,
    required this.temp,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) => Text(
        '$temp°',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
      );
}
