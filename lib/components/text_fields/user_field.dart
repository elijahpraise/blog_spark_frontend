import 'package:blog_spark/components/text_fields/base_text_field.dart';
import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  const UserField(
      {super.key,
      this.initialValue,
      this.labelText,
      this.keyboardType,
      this.onChanged,
      this.validator});
  final String? initialValue, labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      key: key,
      initialValue: initialValue,
      keyboardType: keyboardType,
      labelText: labelText,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
