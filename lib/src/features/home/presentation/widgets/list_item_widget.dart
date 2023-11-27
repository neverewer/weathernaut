import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/presentation/widgets/rounded_box.dart';
import 'package:weathernaut/src/features/home/presentation/widgets/temp_widget.dart';

class ListItemWidget extends StatelessWidget {
  final String time;
  final String imagePath;
  final String temp;
  final bool isNow;

  const ListItemWidget({
    super.key,
    required this.time,
    required this.imagePath,
    required this.temp,
    required this.isNow,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      backgroundColor: isNow ? Colors.white : null,
      borderRadius: 30,
      height: double.infinity,
      width: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              isNow ? 'now' : time,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0XFF9f978f),
              ),
            ),
            Image.asset(imagePath),
            TempWidget(
              temp: temp,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
