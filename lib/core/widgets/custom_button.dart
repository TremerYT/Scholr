import 'package:flutter/material.dart';
import 'package:scholr/core/theme/text_styles.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double height;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBackground = backgroundColor ?? colorScheme.primary;
    final effectiveTextColor = textColor ?? colorScheme.onPrimary;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackground,
          foregroundColor: effectiveTextColor,
          disabledBackgroundColor: effectiveBackground.withValues(alpha: 0.5),
          disabledForegroundColor: effectiveTextColor.withValues(alpha: 0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            CustomText(
              text: text,
              style: AppTextStyles.button.copyWith(
                color: effectiveTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
