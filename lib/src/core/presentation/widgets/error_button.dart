import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/utils/extensions/context_extension.dart';

class ErrorButton extends StatelessWidget {
  final Function()? onPressed;

  const ErrorButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(0.5)),
          shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
        child: Text(
          context.localization.errorButtonText,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF313341),
          ),
        ),
      ),
    );
  }
}
