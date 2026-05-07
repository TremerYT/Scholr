import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scholr/core/theme/theme.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/widgets/auth_background.dart';
import 'package:scholr/features/auth/widgets/custom_form.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/lottie/Login.json",
                  height: 250,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                CustomText(
                  text: "Login to continue using the app.",
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  align: TextAlign.center,
                ),
                SizedBox(height: 10),
                CustomForm(
                  formKey: controller.loginFormKey,
                  fields: controller.loginFields,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) {
                              controller.rememberMe.value = value ?? false;
                            },
                            activeColor: colorScheme.primary,
                          ),
                          CustomText(
                            text: "Remember me",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed("/reset"),
                      child: CustomText(
                        text: "Forgot Password ?",
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(text: "Login", onPressed: controller.login),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SignInButton(
                    Buttons.google,
                    elevation: 1,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    text: "Sign up with Google",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
