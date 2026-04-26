import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/core/theme/text_styles.dart';

class CustomOTP extends StatelessWidget {
  final int length;
  final Function(String) onCompleted;

  const CustomOTP({super.key, this.length = 6, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: AppTextStyles.titleMedium.copyWith(
        color: AppColors.textPrimary,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
    );

    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      onCompleted: onCompleted,

      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary, width: 2),
        ),
      ),

      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: AppColors.secondaryLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary),
        ),
      ),

      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red),
        ),
      ),
    );
  }
}
