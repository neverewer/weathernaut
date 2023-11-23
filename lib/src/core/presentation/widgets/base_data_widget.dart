import 'package:flutter/material.dart';

abstract class BaseDataWidget extends StatelessWidget {
  const BaseDataWidget({super.key});

  @protected
  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFEE3BC),
            Color(0XFFF39876),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: buildChild(context),
    );
  }
}
