import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final int? maxLines;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.maxLines = 1,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      controller: textEditingController,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
