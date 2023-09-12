import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  startLoading() {
    _loading = true;
    notifyListeners();
  }

  stopLoading() {
    _loading = false;
    notifyListeners();
  }
}
