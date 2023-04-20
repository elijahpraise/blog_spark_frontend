import 'package:blog_spark/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  static List _navBarItems = [
    {"iconData": Icons.home_outlined, "label": "Home"},
    {"iconData": Icons.favorite_outline, "label": "Favorites"},
    {"iconData": Icons.create_outlined, "label": "Write"},
    {"iconData": Icons.person_outline, "label": "Profile"},
  ];
  @override
  Widget build(BuildContext context) {
    // double navBarIconPadding = 4;
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, Widget? child) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF5C5D72),
        currentIndex: homeProvider.currentTab,
        onTap: (value) {
          homeProvider.setCurrentTab = value;
        },
        items: _navBarItems.map((e) {
          String label = e["label"];
          IconData iconData = e["iconData"];
          return BottomNavigationBarItem(
              icon: Icon(
                iconData,
              ),
              label: label);
        }).toList(),
        elevation: 0,
      );
    });
  }
}
