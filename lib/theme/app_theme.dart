import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Core colors
  static const Color neonYellow = Color(0xFFE2FF00);
  static const Color darkBackground = Colors.black;
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkGrey = Color(0xFF333333);
  static const Color lightGrey = Color(0xFF666666);

  // Text styles
  static TextStyle getHeadingStyle({required double fontSize}) {
    return GoogleFonts.spaceMono(
      textStyle: TextStyle(
        color: neonYellow,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        height: 0.9,
      ),
    );
  }

  static TextStyle getBodyStyle({required double fontSize}) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      height: 1.4,
    );
  }

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    
    // Color scheme
    colorScheme: ColorScheme.dark(
      primary: neonYellow,
      secondary: neonYellow,
      surface: darkSurface,
      background: darkBackground,
      onPrimary: darkBackground,
      onSecondary: darkBackground,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: getHeadingStyle(fontSize: 56),
      displayMedium: getHeadingStyle(fontSize: 48),
      displaySmall: getHeadingStyle(fontSize: 36),
      headlineLarge: getHeadingStyle(fontSize: 32),
      headlineMedium: getHeadingStyle(fontSize: 28),
      headlineSmall: getHeadingStyle(fontSize: 24),
      bodyLarge: getBodyStyle(fontSize: 20),
      bodyMedium: getBodyStyle(fontSize: 16),
      bodySmall: getBodyStyle(fontSize: 14),
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: getHeadingStyle(fontSize: 20),
    ),

    // Card theme
    cardTheme: CardTheme(
      color: darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: darkGrey,
          width: 1,
        ),
      ),
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: neonYellow,
      size: 24,
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: neonYellow,
        foregroundColor: darkBackground,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.spaceMono(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),

    // Divider theme
    dividerTheme: DividerThemeData(
      color: darkGrey,
      thickness: 1,
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: darkGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: darkGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: neonYellow),
      ),
      filled: true,
      fillColor: darkSurface,
    ),
  );

  // We'll keep a light theme definition but recommend using dark theme
  static ThemeData lightTheme = darkTheme;
}