import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:nectar/core/core.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, required this.controller, this.validator});

  final TextEditingController controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
        labelText: "",
        counterText: "",
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[350]!, width: 1.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[350]!, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]!, width: 1.5),
        ),
      ),
      initialCountryCode: 'EG',
      textAlignVertical: TextAlignVertical(y: -1),
      textAlign: TextAlign.center,
      dropdownTextStyle: theme.titleSmall,
      style: theme.titleSmall,
      cursorColor: AppColors.titleColor,
      validator: validator,
    );
  }
}
