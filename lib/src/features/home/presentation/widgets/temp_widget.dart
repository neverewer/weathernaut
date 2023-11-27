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
        style: TextStyle(
          fontSize: fontSize ?? 60,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF313341),
        ),
      );
}
