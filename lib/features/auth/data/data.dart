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
