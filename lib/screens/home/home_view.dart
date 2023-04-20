import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/components/page_section.dart';
import 'package:blog_spark/components/post_tile/post_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          BlogSparkSizedBox(height: 24),
          PageSection(children: [PostTile()])
        ]))
      ],
    );
  }
}
