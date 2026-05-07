import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/widgets/auth_background.dart';
import 'package:scholr/features/auth/widgets/custom_form.dart';

class ResetView extends GetView<AuthController> {
  const ResetView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 60),
                        CustomText(
                          text: "Reset Your password",
                          style: AppTextStyles.headlineLarge.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16),
                        CustomText(
                          text:
                              "Please enter your email and we will send an OTP code in the next step to reset your password",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomForm(
                          formKey: controller.resetFormKey,
                          fields: controller.resetEmailField,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
