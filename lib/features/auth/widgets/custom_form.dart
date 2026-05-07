import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:scholr/features/auth/model/form_field.dart';

class CustomForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final List<FormFields> fields;

  const CustomForm({super.key, required this.formKey, required this.fields});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final Map<String, bool> obscureMap = {};

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      if (field.isPassword) {
        obscureMap[field.name] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FormBuilder(
      key: widget.formKey,
      child: Column(
        children: [
          ...widget.fields.map((field) {
            final isObscured = obscureMap[field.name] ?? false;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: FormBuilderTextField(
                name: field.name,
                onChanged: (value) {
                  if (field.name == "password") {
                    widget.formKey.currentState?.fields['confirmPassword']
                        ?.validate();
                  }
                },
                obscureText: field.isPassword ? isObscured : false,
                style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
                decoration: InputDecoration(
                  hintText: field.label,
                  hintStyle: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    fontSize: 16,
                  ),
                  suffixIcon: field.isPassword
                      ? IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureMap[field.name] = !isObscured;
                            });
                          },
                        )
                      : null,
                  errorStyle: TextStyle(color: colorScheme.error, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.6),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.6),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.error, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.error, width: 2),
                  ),
                  filled: true,
                  fillColor: colorScheme.surface,
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
