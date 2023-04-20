import 'package:blog_spark/caching/user_shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int _currentTab = 0;
  bool _darkMode = UserSharedPreferences.getThemeMode() ?? false;

  int get currentTab => _currentTab;
  bool get darkMode => _darkMode;

  set setCurrentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }

  set setDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
