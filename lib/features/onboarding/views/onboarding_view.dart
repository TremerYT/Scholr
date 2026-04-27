import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/features/onboarding/controllers/onboarding_controller.dart';

import '../../../core/widgets/custom_text.dart';
import '../data/data.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: controller.skip,
                  child: CustomText(
                    text: "Skip",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    controller.currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];

                    return Padding(
                      padding: const EdgeInsetsGeometry.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            item.image,
                            height: 250,
                            repeat: true,
                            animate: true,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 20),
                          CustomText(
                            text: item.title,
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: AppColors.textPrimary,
                            ),
                            align: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          CustomText(
                            text: item.description,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: controller.currentPage.value == index
                                ? 20
                                : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? AppColors.primary
                                  : AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Obx(() {
                      final isLast =
                          controller.currentPage.value ==
                          onboardingData.length - 1;
                      return CustomButton(
                        text: isLast ? "Get Started" : "Next",
                        onPressed: controller.nextPage,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
