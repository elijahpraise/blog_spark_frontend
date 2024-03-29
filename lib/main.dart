import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:blog_spark/providers/home_provider.dart';
import 'package:blog_spark/providers/providers.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/blog_spark_routes/routes.dart';
import 'package:blog_spark/utils/color_schemes/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  await dotenv.load(fileName: "assets/.env");
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, Widget? child) {
      ThemeMode themeMode =
          homeProvider.darkMode ? ThemeMode.dark : ThemeMode.light;
      return MaterialApp(
        title: 'Blog Spark',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        routes: routes,
        initialRoute: BlogSparkRoutes.signIn,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
