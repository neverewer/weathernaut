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
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
