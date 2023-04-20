import 'package:blog_spark/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NightMode extends StatefulWidget {
  const NightMode({super.key});

  @override
  State<NightMode> createState() => _NightModeState();
}

class _NightModeState extends State<NightMode> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, Widget? child) {
      bool darkMode = homeProvider.darkMode;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            homeProvider.setDarkMode = !darkMode;
          },
          child: Icon(darkMode ? Icons.light_mode : Icons.dark_mode),
        ),
      );
    });
  }
}
