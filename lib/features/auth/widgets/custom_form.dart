import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:scholr/core/widgets/custom_button.dart';
import 'package:scholr/features/auth/model/form_field.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final List<FormFields> fields;
  final String buttonText;

  const CustomForm({
    super.key,
    required this.formKey,
    required this.fields,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          ...fields.map((field) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: FormBuilderTextField(
                name: field.name,
                obscureText: field.isPassword,
                decoration: InputDecoration(
                  hintText: field.label,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
          SizedBox(
            width: double.infinity,
            child: CustomButton(text: buttonText, onPressed: () => {}),
          ),
        ],
      ),
    );
  }
}
