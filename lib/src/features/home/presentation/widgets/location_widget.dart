import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String text;

  const LocationWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: Color(0xFF313341),
        ),
      ),
    );
  }
}
