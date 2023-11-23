import 'package:flutter/material.dart';

class WeatherImageWidget extends StatelessWidget {
  final String imagePath;

  const WeatherImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) => Image.asset(
        imagePath,
        height: 150,
        width: 150,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      );
}
