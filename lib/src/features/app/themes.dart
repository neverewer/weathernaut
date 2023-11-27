import 'package:flutter/material.dart';

class Themes {
  TextStyle get appTextStyle => const TextStyle(color: Color(0xFF313341));

  static ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(foregroundColor: Color(0xFF313341)),
        // textTheme: const TextTheme(
        //   bodyMedium: ,
        //   displayMedium: TextStyle(color: Colors.green),
        //   displaySmall: TextStyle(color: Colors.green),
        // ).);
      );
}