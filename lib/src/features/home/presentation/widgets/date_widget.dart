import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String text;

  const DateWidget({
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
          fontSize: 20,
          color: Color(0XFF9f978f),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
