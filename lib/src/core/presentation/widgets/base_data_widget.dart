import 'package:flutter/material.dart';

@Deprecated('In MaterialApp.router builder set background')
abstract class BaseDataWidget extends StatelessWidget {
  const BaseDataWidget({super.key});

  @protected
  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: buildChild(context),
    );
  }
}
