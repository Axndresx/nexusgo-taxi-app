import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const primaryColor = Color(0xFF00182E); // Background color
  static const secondaryColor = Color(0xFF002847); // Card background
  static const darkAccent = Color(0xFF001525); // Dark sections
  static const primaryText = Color(0xFFFFFFFF); // White text
  static const secondaryText = Color(0xFFE0E0E0); // Light gray text
  static const accentBlue = Color(0xFF4A90E2); // Primary buttons
  static const successGreen = Color(0xFF2ECC71); // Success/Confirmation
  static const errorRed = Color(0xFFE74C3C); // Error/Cancel

  // Typography
  static const headlineStyle = TextStyle(
    fontFamily: 'Gagalin',
    color: primaryText,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const bodyStyle = TextStyle(
    fontFamily: 'CormorantGaramond',
    color: primaryText,
    fontSize: 16,
  );

  static const buttonStyle = TextStyle(
    fontFamily: 'CormorantGaramond',
    color: primaryText,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Theme Data
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: accentBlue,
      secondary: secondaryColor,
      surface: primaryColor,
      error: errorRed,
    ),
    textTheme: TextTheme(
      displayLarge: headlineStyle,
      displayMedium: headlineStyle.copyWith(fontSize: 20),
      bodyLarge: bodyStyle,
      bodyMedium: bodyStyle.copyWith(fontSize: 14),
      labelLarge: buttonStyle,
    ),
    cardTheme: const CardThemeData(
      color: secondaryColor,
      elevation: 4,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentBlue,
        foregroundColor: primaryText,
        textStyle: buttonStyle,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Gagalin',
        color: primaryText,
        fontSize: 20,
      ),
    ),
  );
}
