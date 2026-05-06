import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFF0D6EFD);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: const Color(0xFFF7F8FA),
    cardColor: Colors.white,
    dividerColor: const Color(0xFFE8E8E8),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF1B1E28)),
      bodyMedium: TextStyle(color: Color(0xFF1B1E28)),
      bodySmall: TextStyle(color: Color(0xFF7D848D)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF1B1E28)),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    scaffoldBackgroundColor: const Color(0xFF18191A),
    cardColor: const Color(0xFF242526),
    dividerColor: const Color(0xFF3A3B3C),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFE4E6EB)),
      bodyMedium: TextStyle(color: Color(0xFFE4E6EB)),
      bodySmall: TextStyle(color: Color(0xFFB0B3B8)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFE4E6EB)),
  );
}
