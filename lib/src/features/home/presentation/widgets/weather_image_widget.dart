import 'package:flutter/material.dart';

class WeatherImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const WeatherImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) => Image.asset(
        imagePath,
        height: height ?? 150,
        width: width ?? 150,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      );
}
