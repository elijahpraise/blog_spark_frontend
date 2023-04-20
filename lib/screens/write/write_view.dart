import 'package:flutter/material.dart';

class WriteView extends StatelessWidget {
  const WriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverList(delegate: SliverChildListDelegate([]))],
    );
  }
}
