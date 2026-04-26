import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/data/data.dart';
import 'package:scholr/features/auth/widgets/custom_form.dart';

class ResetView extends GetView<AuthController> {
  const ResetView({super.key});

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
                    text: "Reset Your password",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomText(
                    text:
                        "Please enter your email and we will send an OTP code in the next step to reset your password",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomForm(
                    formKey: controller.resetFormKey,
                    fields: resetFormData,
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Send OTP",
                      onPressed: controller.reset,
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
