import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:flutter/material.dart';

class BlogSparkActions {
  const BlogSparkActions(
      {required this.context,
      required this.response,
      required this.successRoute,
      this.errorRoute = ""});
  final String successRoute;
  final String errorRoute;
  final BuildContext context;
  final BlogSparkResponse response;

  static const String serverError =
      "No internet connection, please try again later";
  static const String timeoutError = "Timeout error";

  Future get success => Navigator.of(context).pushNamed(successRoute);
  Future? get error => errorRoute.isNotEmpty
      ? Navigator.of(context).pushNamed(errorRoute)
      : null;

  snackBar({required String content}) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ));

  Function get takeAction => () {
        print(response.responseType);
        switch (response.responseType) {
          case ResponseStatus.http200:
            success;
            break;
          case ResponseStatus.http201:
            Map<String, dynamic> body = response.body;
            if (body.containsKey("email")) {
              UserSharedPreferences.setToken(body["token"]);
              UserSharedPreferences.setEmail(body["email"]);
              UserSharedPreferences.setFirstname(body["first_name"]);
              UserSharedPreferences.setLastname(body["last_name"]);
              UserSharedPreferences.setSignedIn(true);
            }
            success;
            break;
          case ResponseStatus.http400:
            print("400 - ${response.body}");
            break;
          case ResponseStatus.http401:
            print("401 - ${response.body}");
            error;
            break;
          case ResponseStatus.http404:
            print("404 - ${response.body}");
            break;
          case ResponseStatus.http500:
            print("500 - ${response.body}");
            break;
          case ResponseStatus.serverError:
            snackBar(content: serverError);
            break;
          case ResponseStatus.timeout:
            snackBar(content: timeoutError);
            break;
        }
      };
}
