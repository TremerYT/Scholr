import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:scholr/features/auth/data/data.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormBuilderState>();
  final loginFields = loginFormData;
  var rememberMe = false.obs;

  void login() {
    if (loginFormKey.currentState?.saveAndValidate() ?? false) {
      final values = loginFormKey.currentState!.value;
      print(values);
    }
  }
}
