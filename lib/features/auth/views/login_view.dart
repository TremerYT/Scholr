import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(children: []),
        ),
      ),
    );
  }
}
