import 'package:flutter/material.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/features/app/app.dart';

void main() {
  final router = AppRouter();
  runApp(App(router: router));
}
