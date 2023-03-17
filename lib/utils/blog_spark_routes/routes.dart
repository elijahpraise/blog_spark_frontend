import 'package:blog_spark/screens/onboarding/getting_started.dart';
import 'package:blog_spark/screens/onboarding/splash_screen.dart';
import 'package:blog_spark/screens/sign_in/sign_in.dart';
import 'package:blog_spark/screens/sign_up/sign_up.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // On boarding
  BlogSparkRoutes.splashScreen: (_) => SplashScreen(),
  BlogSparkRoutes.gettingStarted: (_) => GettingStarted(),

  // Sign up
  BlogSparkRoutes.signUp: (_) => SignUp(),

  // Sign in
  BlogSparkRoutes.signIn: (_) => SignIn()
};
