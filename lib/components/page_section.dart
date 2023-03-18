import 'package:flutter/material.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key, required this.children, this.padding})
      : super(key: key);
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
