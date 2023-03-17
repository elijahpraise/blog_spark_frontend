import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:blog_spark/components/blog_spark_icon.dart';
import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/utils/blog_spark_icons/icon_names.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/responsive_values/responsive_values.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool hasSignedIn;

  void _navigateToNextScreen() {
    hasSignedIn = UserSharedPreferences.getSignedIn() ?? false;
    Future.delayed(
      Duration(seconds: 2),
      () {
        String routeName = hasSignedIn
            ? BlogSparkRoutes.signIn
            : BlogSparkRoutes.gettingStarted;
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveValue value = ResponsiveValue(context: context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlogSparkIcon(
              icon: BlogSparkIcons.blogSpark,
              height: value.height(200),
              width: value.height(200),
            ),
            BlogSparkSizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
