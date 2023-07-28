import 'package:flutter/material.dart';

class AppLightTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      border: OutlineInputBorder(borderSide: BorderSide.none),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.6,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
