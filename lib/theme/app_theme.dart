import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF2962FF),
        secondary: const Color(0xFF00B0FF),
        surface: Colors.grey[100]!,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: _textTheme(Colors.black87),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black87,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFF2962FF),
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF2962FF),
        secondary: const Color(0xFF00B0FF),
        surface: Colors.grey[900]!,
      ),
      scaffoldBackgroundColor: Colors.grey[900]!,
      textTheme: _textTheme(Colors.white70),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900]!,
        elevation: 1,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFF2962FF),
        foregroundColor: Colors.white,
      ),
    );
  }

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32, 
        fontWeight: FontWeight.bold, 
        color: color,
      ),
      displayMedium: TextStyle(
        fontSize: 28, 
        fontWeight: FontWeight.w600, 
        color: color,
      ),
      titleLarge: TextStyle(
        fontSize: 22, 
        fontWeight: FontWeight.w500, 
        color: color,
      ),
      bodyLarge: TextStyle(
        fontSize: 18, 
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 16, 
        color: color,
      ),
      labelLarge: TextStyle(
        fontSize: 14, 
        color: color,
      ),
    );
  }
}