import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:scholr/features/auth/controllers/auth_controller.dart';
import 'package:scholr/features/auth/model/form_field.dart';

final loginFormData = [
  FormFields(
    name: "email",
    label: "Email Address",
    validators: [
      FormBuilderValidators.required(),
      FormBuilderValidators.email(),
    ],
  ),
  FormFields(
    name: "password",
    label: "Password",
    isPassword: true,
    validators: [
      FormBuilderValidators.required(),
      FormBuilderValidators.password(),
    ],
  ),
];

final resetFormData = [
  FormFields(
    name: "email",
    label: "Email Address",
    validators: [
      FormBuilderValidators.required(),
      FormBuilderValidators.email(),
    ],
  ),
];

final resetPasswordFormData = [
  FormFields(
    name: "password",
    label: "Enter your new Password",
    isPassword: true,
    validators: [
      FormBuilderValidators.required(),
      FormBuilderValidators.password(),
    ],
  ),
  FormFields(
    name: "confirmPassword",
    label: "Confirm your new Password",
    isPassword: true,
    validators: [
      (value) {
        final formState =
            Get.find<AuthController>().resetPasswordFormKey.currentState;

        final password = formState?.fields['password']?.value;

        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        }

        if (value != password) {
          return "Passwords do not match";
        }

        return null;
      },
    ],
  ),
];
