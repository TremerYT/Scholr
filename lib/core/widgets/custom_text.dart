import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? align;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium;
    return Text(
      text,
      textAlign: align,
      style:
          style ??
          baseStyle?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}
