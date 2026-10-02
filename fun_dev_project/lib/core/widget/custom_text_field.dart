import 'package:flutter/material.dart';
import 'package:fun_dev_project/core/utl/responsive.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
        left: responsiveWidth(context, 16),
        right: responsiveWidth(context, 16),
      ),
      child: TextField(
        onChanged: onChanged,
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: responsiveWidth(context, 20),
            right: responsiveWidth(context, 20),
            top: responsiveHeight(context, 14),
            bottom: responsiveHeight(context, 14),
          ),

          errorText: errorText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          label: Text(
            label,
            style: TextStyle(
              color: const Color(0xFF9B9B9B),
              fontSize: 11,
              fontFamily: 'Metropolis',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
