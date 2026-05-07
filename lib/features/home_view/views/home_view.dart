import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/utils/utils.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isBalanceVisible = true.obs;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: colorScheme.onPrimary,
              child: Icon(Icons.person, color: colorScheme.primary),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomText(
                text: '${getGreeting()},\nJeffery \u{1F44B}',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: colorScheme.onPrimary,
                  fontSize: 16,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: colorScheme.onPrimary,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: colorScheme.onPrimary,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "School Fees Balance:",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap: () => isBalanceVisible.value =
                                  !isBalanceVisible.value,
                              child: Icon(
                                isBalanceVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: colorScheme.onPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Obx(
                        () => ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: isBalanceVisible.value ? 0 : 6,
                            sigmaY: isBalanceVisible.value ? 0 : 6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Ksh 4000.00",
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                              CustomText(
                                text: "Total Paid : Ksh 373,174.76",
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(text: "View Statements", onPressed: () {}),
                    ],
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
