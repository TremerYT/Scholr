import 'package:form_builder_validators/form_builder_validators.dart';
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
      FormBuilderValidators.required(),
      FormBuilderValidators.password(),
    ],
  ),
];
