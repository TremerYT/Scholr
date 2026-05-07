import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:scholr/core/theme/text_styles.dart';

class CustomOTP extends StatelessWidget {
  final int length;
  final Function(String) onCompleted;

  const CustomOTP({super.key, this.length = 6, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: AppTextStyles.titleMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6)),
      ),
    );

    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      onCompleted: onCompleted,

      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.primary, width: 2),
        ),
      ),

      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: colorScheme.secondary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.primary),
        ),
      ),

      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.error),
        ),
      ),
    );
  }
}
