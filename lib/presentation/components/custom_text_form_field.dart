import 'package:flutter/material.dart';

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
          borderSide: BorderSide(color: Color(0XFF7C7C7C), width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
