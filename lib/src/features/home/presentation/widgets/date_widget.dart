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
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0XFF9f978f),
            ),
      ),
    );
  }
}
