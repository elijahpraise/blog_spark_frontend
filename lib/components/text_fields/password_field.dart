import 'package:blog_spark/components/text_fields/base_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onChanged, this.validator});
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _visible;
  @override
  void initState() {
    super.initState();
    _visible = true;
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      key: widget.key,
      labelText: "Password",
      keyboardType: TextInputType.visiblePassword,
      obscureText: _visible,
      validator: widget.validator,
      suffixIcon: InkWell(
        onTap: () => setState(() {
          _visible = !_visible;
        }),
        child: Icon(_visible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined),
      ),
      onChanged: widget.onChanged,
    );
  }
}
