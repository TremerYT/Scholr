import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/widgets/auth_background.dart';
import 'package:scholr/features/auth/widgets/custom_form.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        CustomText(
                          text: "Reset password to access your Scholr account",
                          style: AppTextStyles.headlineLarge.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16),
                        CustomForm(
                          formKey: controller.resetPasswordFormKey,
                          fields: controller.resetPasswordFields,
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Continue",
                            onPressed: controller.resetPassword,
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
