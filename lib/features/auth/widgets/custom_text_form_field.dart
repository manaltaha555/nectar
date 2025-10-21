import 'package:flutter/material.dart';
import 'package:nectar/core/core.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    required this.hint,
    required this.isObsecure,
    required this.validator,
    required this.controller,
  });
  final String hint;
  final String? Function(String?) validator;
  final IconButton? suffixIcon;
  final TextInputType keyboardType = TextInputType.text;
  final bool isObsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.labelLarge,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.subtitleColor, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.titleColor, width: 1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
