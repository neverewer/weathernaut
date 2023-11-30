import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';

class WeatherStatWidget extends StatelessWidget {
  final String leadingImagePath;
  final String label;
  final String value;

  const WeatherStatWidget({
    super.key,
    required this.leadingImagePath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      contentPadding: const EdgeInsets.only(top: 10, right: 35, left: 15, bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: RoundedBox(
            borderRadius: 10,
            contentPadding: const EdgeInsets.all(4),
            backgroundColor: Colors.white,
            child: Image.asset(
              leadingImagePath,
              width: 35,
              height: 35,
            )),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
