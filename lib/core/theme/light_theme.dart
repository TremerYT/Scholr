import 'package:flutter/material.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    error: Colors.red,
    onPrimary: AppColors.textInverse,
    onSecondary: AppColors.textPrimary,
    onSurface: AppColors.textPrimary,
    onError: AppColors.textInverse,
  ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: AppTextStyles.textTheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.textInverse,
  ),
);