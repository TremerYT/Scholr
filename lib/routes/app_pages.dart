import 'package:get/get.dart';
import 'package:scholr/features/auth/bindings/auth_binding.dart';
import 'package:scholr/features/auth/views/login_view.dart';
import 'package:scholr/features/auth/views/reset_password_view.dart';
import 'package:scholr/features/auth/views/reset_view.dart';
import 'package:scholr/features/auth/views/verification_view.dart';
import 'package:scholr/features/home_view/views/home_view.dart';
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
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.reset,
      page: () => ResetView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => VerificationView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeView()),
  ];
}
