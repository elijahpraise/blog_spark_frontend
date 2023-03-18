import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {super.key,
      this.textAlign = TextAlign.start,
      this.readOnly = false,
      this.obscureText = false,
      this.minLines = 1,
      this.initialValue,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.keyboardType,
      this.controller,
      this.onChanged,
      this.onSaved,
      this.onEditingComplete,
      this.inputFormatters,
      this.validator});
  final int minLines;
  final bool readOnly;
  final bool obscureText;
  final String? initialValue, labelText;
  final Widget? prefixIcon, suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      validator: validator,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textAlign: textAlign,
      readOnly: readOnly,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      maxLines: minLines,
      minLines: minLines,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
