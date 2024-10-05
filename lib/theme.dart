import 'package:flutter/material.dart';

Color surfaceColor = Colors.white;
Color primaryColor = Colors.red.shade700;
Color secondaryColor = Colors.red.shade400;
Color inversePrimaryColor = Colors.white;

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: surfaceColor,
    primary: primaryColor,
    secondary: secondaryColor,
    inversePrimary: inversePrimaryColor,
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: primaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: primaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: inversePrimaryColor,
    ),
  ),
);
