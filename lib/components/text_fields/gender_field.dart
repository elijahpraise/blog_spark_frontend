import 'package:blog_spark/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class GenderField extends StatelessWidget {
  const GenderField({super.key, this.onChanged, this.validator});
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: validator,
      items: BlogSparkConstants.genders
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e.toLowerCase(),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(labelText: "Gender"),
    );
  }
}
