import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:scholr/features/auth/data/data.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormBuilderState>();
  final resetFormKey = GlobalKey<FormBuilderState>();
  final loginFields = loginFormData;
  var rememberMe = false.obs;
  var otpCode = ''.obs;
  var seconds = 60.obs;

  void login() {
    if (loginFormKey.currentState?.saveAndValidate() ?? false) {
      // TO BE IMPLEMENTED
    }
  }

  void reset() {
    if (resetFormKey.currentState?.saveAndValidate() ?? false) {
      final data = resetFormKey.currentState!.value;
      final email = data["email"];
      seconds.value = 60;
      startTimer();
      Get.toNamed("/verification", arguments: email);
    }
  }

  void setOtp(String code) {
    otpCode.value = code;
  }

  void verifyOtp() {
    if (otpCode.value.isEmpty) {
      Get.snackbar("Error", "Please enter OTP");
    }
  }

  void startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (seconds.value > 0) {
        seconds.value--;
        return true;
      }
      return false;
    });
  }
}
