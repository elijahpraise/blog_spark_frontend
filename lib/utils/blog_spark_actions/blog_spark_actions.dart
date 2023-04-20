import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlogSparkActions {
  const BlogSparkActions(
      {required this.context,
      required this.response,
      required this.successRoute,
      this.shouldReplace = false,
      this.errorRoute = ""});
  final bool shouldReplace;
  final String successRoute;
  final String errorRoute;
  final BuildContext context;
  final BlogSparkResponse response;

  static const String serverError =
      "No internet connection, please try again later";
  static const String timeoutError = "Timeout error";

  static Future showLoading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SpinKitCircle(
        color: Color(0xFF181D8C),
      ),
    );
  }

  Future get success => shouldReplace
      ? Navigator.of(context).pushReplacementNamed(successRoute)
      : Navigator.of(context).pushNamed(successRoute);
  Future? get error => errorRoute.isNotEmpty
      ? shouldReplace
          ? Navigator.of(context).pushReplacementNamed(errorRoute)
          : Navigator.of(context).pushNamed(errorRoute)
      : null;

  snackBar({required String content}) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));

  void takeAction({void Function()? onSuccess, void Function()? onError}) {
    print(response.responseType);
    switch (response.responseType) {
      case ResponseStatus.http200:
      case ResponseStatus.http201:
        onSuccess!();
        success;
        break;
      case ResponseStatus.http400:
        snackBar(content: response.body);
        onError!();
        print("400 - ${response.body}");
        break;
      case ResponseStatus.http401:
        print("401 - ${response.body}");
        onError!();
        error;
        break;
      case ResponseStatus.http404:
        print("404 - ${response.body}");
        onError!();
        break;
      case ResponseStatus.http500:
        print("500 - ${response.body}");
        snackBar(content: response.body);
        onError!();
        break;
      case ResponseStatus.serverError:
        onError!();
        snackBar(content: serverError);
        break;
      case ResponseStatus.timeout:
        onError!();
        snackBar(content: timeoutError);
        break;
    }
  }
}
