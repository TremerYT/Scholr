import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:scholr/core/theme/colors.dart';
import 'package:scholr/features/auth/model/form_field.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final List<FormFields> fields;
  final String? buttonText;
  final VoidCallback? onSubmit;

  const CustomForm({
    super.key,
    required this.formKey,
    required this.fields,
    this.buttonText,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          ...fields.map((field) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FormBuilderTextField(
                name: field.name,
                obscureText: field.isPassword,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: field.label,
                  hintStyle: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.divider),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.divider,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                ),
                validator: field.validators != null
                    ? (value) {
                        for (var v in field.validators!) {
                          final result = v(value);
                          if (result != null) return result;
                        }
                        return null;
                      }
                    : null,
              ),
            );
          }),
        ],
      ),
    );
  }
}
