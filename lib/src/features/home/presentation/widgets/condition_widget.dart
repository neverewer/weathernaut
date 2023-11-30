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
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
      );
}
