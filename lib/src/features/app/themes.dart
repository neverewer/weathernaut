import 'package:flutter/material.dart';

class Themes {
  static const Color _defaultTextColor = Color(0xFF313341);

  static ThemeData getTheme() => ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xFF313341),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: _defaultTextColor, fontSize: 60),
          headlineMedium: TextStyle(color: _defaultTextColor, fontSize: 34),
          bodyLarge: TextStyle(color: _defaultTextColor, fontSize: 20),
          bodyMedium: TextStyle(color: _defaultTextColor, fontSize: 16),
          bodySmall: TextStyle(color: _defaultTextColor, fontSize: 12),
        ),
      );
}
