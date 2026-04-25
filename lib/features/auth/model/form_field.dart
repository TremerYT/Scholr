class FormFields {
  final String name;
  final String label;
  final bool isPassword;
  final List<String? Function(String?)>? validators;

  FormFields({
    required this.name,
    required this.label,
    this.isPassword = false,
    this.validators,
  });
}
