import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_button.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_image.dart';
import 'package:weathernaut/src/core/presentation/widgets/error_text.dart';

class FailtureWidget extends StatelessWidget {
  final String? errorMessage;
  final Function()? errorButtonCallback;

  const FailtureWidget({
    super.key,
    this.errorMessage,
    this.errorButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const ErrorImage(),
            ErrorText(text: errorMessage),
            const Spacer(),
            ErrorButton(onPressed: errorButtonCallback),
          ],
        ),
      ),
    );
  }
}
