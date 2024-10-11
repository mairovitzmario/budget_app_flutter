import 'package:flutter/material.dart';

Color surfaceColor = Colors.white;
Color primaryColor = Colors.red.shade700;
Color secondaryColor = Colors.red.shade300;
Color inversePrimaryColor = Colors.white;

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: surfaceColor,
    primary: primaryColor,
    secondary: secondaryColor,
    inversePrimary: inversePrimaryColor,
  ),
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
    bodyLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: inversePrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: inversePrimaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: inversePrimaryColor,
    ),
  ),
);

InputDecoration buildTextFieldInputDecoration(
    BuildContext context, String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: Theme.of(context).colorScheme.secondary),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.5,
      ),
    ),
  );
}

Color getAdaptiveColor(Color backgroundColor) {
  if (backgroundColor.computeLuminance() <= 0.5) {
    return Colors.white;
  } else
    return Colors.black;
}
