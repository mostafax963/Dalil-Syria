import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0D6EFD);
  static const white = Colors.white;

  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF18191A)
      : const Color(0xFFF7F8FA);

  static Color card(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF242526)
      : Colors.white;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFFE4E6EB)
      : const Color(0xFF1B1E28);

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFFB0B3B8)
      : const Color(0xFF7D848D);

  static Color divider(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF3A3B3C)
      : const Color(0xFFE8E8E8);

  static Color icon(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFFE4E6EB)
      : const Color(0xFF1B1E28);
}
