import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/widgets/auth_background.dart';
import 'package:scholr/features/auth/widgets/custom_otp.dart';

class VerificationView extends GetView<AuthController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              CustomText(
                text: "OTP code verification",
                style: AppTextStyles.headlineLarge.copyWith(
                  color: colorScheme.onSurface,
                ),
                align: TextAlign.start,
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.bodySmall.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(text: "We have sent an OTP code to "),
                    TextSpan(
                      text: "${Get.arguments ?? 'your email'}",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    const TextSpan(text: " \nEnter the OTP below to verify"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(child: CustomOTP(length: 6, onCompleted: controller.setOtp)),
              SizedBox(height: 16),
              Center(
                child: CustomText(
                  text: "Didn't receive code in your email?",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Obx(
                () => Center(
                  child: CustomText(
                    text: controller.seconds.value > 0
                        ? "You can resend code in ${controller.seconds.value}s"
                        : "Resend Code",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Continue",
                    onPressed: controller.otpCode.value.length == 6
                        ? controller.verifyOtp
                        : null,
                    backgroundColor: controller.otpCode.value.length == 6
                        ? colorScheme.primary
                        : colorScheme.onSurface.withValues(alpha: 0.35),
                    textColor: colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
