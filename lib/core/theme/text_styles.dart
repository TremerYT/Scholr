import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _base => GoogleFonts.poppins();

  static TextStyle get displayLarge => _base.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );

  static TextStyle get displayMedium => _base.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get displaySmall => _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get headlineLarge => _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get headlineMedium => _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get headlineSmall => _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleLarge => _base.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleMedium => _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static TextStyle get titleSmall => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle get bodyLarge => _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodyMedium => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodySmall => _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get labelLarge => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelMedium => _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelSmall => _base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static TextStyle get button => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
  );

  static TextStyle get link => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextTheme get textTheme => TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}