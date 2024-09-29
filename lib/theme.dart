import 'package:flutter/material.dart';

Color surfaceColor = Colors.white;
Color primaryColor = Colors.red.shade700;
Color secondaryColor = Colors.red.shade200;
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
        fontSize: 50, fontWeight: FontWeight.w700, color: primaryColor),
    bodySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: inversePrimaryColor),
  ),
);
