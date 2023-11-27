import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          child: Divider(
            height: 6,
            thickness: 1.5,
            color: Color(0XFFd6996b),
          ),
        ),
        Positioned(
          left: 30,
          bottom: 0.75,
          child: SizedBox(
            height: 5,
            width: 18,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF313341),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
