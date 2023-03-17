import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogSparkIcon extends StatelessWidget {
  const BlogSparkIcon(
      {super.key, required this.icon, this.color, this.height, this.width});
  final String icon;
  final Color? color;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$icon.svg",
      height: height,
      width: width,
      color: color,
    );
  }
}
