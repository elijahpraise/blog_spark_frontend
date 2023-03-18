import 'dart:async';

import 'package:blog_spark/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField(
      {super.key, this.initialValue, this.onChanged, this.validator});
  final String? initialValue;
  final void Function(PhoneNumber)? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialValue: initialValue,
      initialCountryCode: BlogSparkConstants.initialCountryCode,
      validator: validator,
      showDropdownIcon: false,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: "Phone number"),
    );
  }
}
