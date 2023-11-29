import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  final String condition;

  const ConditionWidget({
    super.key,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) => Text(
        condition,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: Color(0xFF313341),
        ),
      );
}
