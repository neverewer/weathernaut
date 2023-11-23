import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  final String temp;

  const TempWidget({
    super.key,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) => Text(
        temp,
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w600,
          color: Color(0xFF313341),
        ),
      );
}
