import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Alignment? childAlignment;
  final Widget child;
  final Color? backgroundColor;

  const RoundedBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.childAlignment,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? double.infinity,
        height: height ?? 80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.55),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 15),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        ));
  }
}
