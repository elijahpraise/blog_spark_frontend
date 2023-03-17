import 'package:blog_spark/utils/responsive_values/responsive_values.dart';
import 'package:flutter/material.dart';

class BlogSparkSizedBox extends StatelessWidget {
  const BlogSparkSizedBox(
      {super.key, required this.height, this.width, this.child});
  final double height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    ResponsiveValue value = ResponsiveValue(context: context);
    return SizedBox(
      height: value.height(height),
      width: width,
      child: child,
    );
  }
}
