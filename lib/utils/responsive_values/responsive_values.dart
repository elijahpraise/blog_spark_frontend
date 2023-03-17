import 'package:flutter/material.dart';

class ResponsiveValue {
  final BuildContext context;
  ResponsiveValue({required this.context});

  static const double _designHeight = 844;
  // static const double _designWidth = 390;

  double height(double height) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    Size deviceSize = MediaQuery.of(context).size;
    if (deviceOrientation == Orientation.landscape) {
      return height;
    }
    double deviceHeight = deviceSize.height;
    double result = (deviceHeight * height) / _designHeight;
    return result;
  }

  double fontSize(double fontSize) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    Size deviceSize = MediaQuery.of(context).size;
    if (deviceOrientation == Orientation.landscape) {
      return fontSize;
    }
    double height = deviceSize.height;
    double result = ((height * fontSize) / _designHeight);
    return result;
  }
}
