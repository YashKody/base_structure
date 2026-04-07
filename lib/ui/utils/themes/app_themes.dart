import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark
  );
}