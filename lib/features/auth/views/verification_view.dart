import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/widgets/custom_otp.dart';

class VerificationView extends GetView<AuthController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, Colors.white],
              stops: [0.0, 0.3],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  CustomText(
                    text: "OTP code verification",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    align: TextAlign.start,
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      children: [
                        TextSpan(text: "We have sent an OTP code to "),
                        TextSpan(
                          text: "${Get.arguments ?? 'your email'}",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const TextSpan(
                          text: " \nEnter the OTP below to verify",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: CustomOTP(length: 6, onCompleted: controller.setOtp),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: CustomText(
                      text: "Didn't receive code in your email?",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
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
                          color: AppColors.textPrimary,
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
                            ? AppColors.primary
                            : const Color.fromARGB(255, 157, 157, 157),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
