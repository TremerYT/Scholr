import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/core/theme/text_styles.dart';
import 'package:scholr/core/utils/utils.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/core/widgets/custom_text.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomText(
                text: '${getGreeting()},\nJeffery \u{1F44B}',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textInverse,
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
            color: AppColors.textInverse,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: AppColors.textInverse,
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
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "School Fees Balance:",
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textInverse,
                        ),
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Ksh 4000.00",
                            style: AppTextStyles.headlineLarge.copyWith(
                              color: AppColors.textInverse,
                              fontSize: 29,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        text: "Total Paid : Ksh 373,174.76",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textInverse,
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
