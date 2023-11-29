import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Alignment? childAlignment;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;

  const RoundedBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.childAlignment,
    required this.child,
    this.backgroundColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16))),
      child: Padding(padding: contentPadding ?? EdgeInsets.zero, child: child),
    );
  }
}
