import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
  });
  final TextEditingController? controller;
  final String label;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        label: Text(label),
      ),
    );
  }
}
