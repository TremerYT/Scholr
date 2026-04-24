import 'package:get/get.dart';
import 'package:scholr/features/onboarding/bindings/onboarding_binding.dart';
import 'package:scholr/features/onboarding/views/onboarding_view.dart';
import 'package:scholr/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
  ];
}
