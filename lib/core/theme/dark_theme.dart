import 'package:flutter/material.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryLight,
    secondary: AppColors.secondary,
    surface: Color(0xff111827),
    error: Color(0xffF87171),
    onPrimary: AppColors.textInverse,
    onSecondary: AppColors.textPrimary,
    onSurface: AppColors.textInverse,
    onError: AppColors.textPrimary,
  ),
  scaffoldBackgroundColor: Color(0xff030712),
  textTheme: AppTextStyles.textTheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff1F2937),
    foregroundColor: AppColors.textInverse,
  ),
);