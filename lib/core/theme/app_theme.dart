import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white);

  static ThemeData get dark => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorConstants.background,
    primaryColor: ColorConstants.primary,
    colorScheme: const ColorScheme.dark(
      primary: ColorConstants.primary,
      secondary: ColorConstants.primary,
    ),
    textTheme: const TextTheme(
      // Headlines
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: ColorConstants.textPrimary,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: ColorConstants.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorConstants.textPrimary,
      ),

      // Body Text
      bodyLarge: TextStyle(fontSize: 18, color: ColorConstants.textPrimary),
      bodyMedium: TextStyle(fontSize: 16, color: ColorConstants.textPrimary),
      bodySmall: TextStyle(fontSize: 14, color: ColorConstants.textPrimary, height: 1.2),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.buttonBackground,
        foregroundColor: ColorConstants.buttonText,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    ),
  );

  // Terms Text Styles
  static TextStyle get termsTextStyle => dark.textTheme.bodySmall!;

  static TextStyle get termsLinkStyle => dark.textTheme.bodySmall!.copyWith(
    color: ColorConstants.termsLink,
    fontWeight: FontWeight.bold,
  );
}
