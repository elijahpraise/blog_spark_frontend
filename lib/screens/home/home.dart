import 'package:blog_spark/components/blog_spark_icon.dart';
import 'package:blog_spark/components/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_spark/components/drawers/home_drawer.dart';
import 'package:blog_spark/components/home_actions/night_mode.dart';
import 'package:blog_spark/components/home_actions/search.dart';
import 'package:blog_spark/providers/home_provider.dart';
import 'package:blog_spark/screens/favorites/favorites_view.dart';
import 'package:blog_spark/screens/home/home_view.dart';
import 'package:blog_spark/screens/profile/profile_view.dart';
import 'package:blog_spark/screens/write/write_view.dart';
import 'package:blog_spark/utils/blog_spark_icons/icon_names.dart';
import 'package:blog_spark/utils/responsive_values/responsive_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<Widget> _bottomNavScreens = const [
    HomeView(),
    FavoritesView(),
    WriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    double value = ResponsiveValue(context: context).height(30);
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: BlogSparkIcon(
            icon: BlogSparkIcons.blogSpark,
            height: value,
            width: value,
          ),
          actions: [
            Search(),
            NightMode(),
          ],
        ),
        drawer: HomeDrawer(),
        body: _bottomNavScreens[homeProvider.currentTab],
        bottomNavigationBar: BottomAppBar(
          child: BottomNavBar(),
        ),
      );
    });
  }
}
