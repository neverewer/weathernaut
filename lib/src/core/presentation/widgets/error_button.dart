import 'package:flutter/material.dart';

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
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.white.withOpacity(0.5),
          ),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'Retry',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF313341),
          ),
        ),
      ),
    );
  }
}
