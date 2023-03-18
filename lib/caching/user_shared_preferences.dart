import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _preferences;
  static const _hasSignedIn = "isUserSignedIn";
  static const _firstname = "firstname";
  static const _lastname = "lastname";
  static const _email = "email";
  static const _darkMode = "darkMode";
  static const _token = "token";

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setSignedIn(bool value) async {
    await _preferences!.setBool(_hasSignedIn, value);
  }

  static setToken(String value) async {
    await _preferences!.setString(_token, value);
  }

  static setDarkMode(bool value) async {
    await _preferences!.setBool(_darkMode, value);
  }

  static setFirstname(String value) async {
    await _preferences!.setString(_firstname, value);
  }

  static setLastname(String value) async {
    await _preferences!.setString(_lastname, value);
  }

  static setEmail(String value) async {
    await _preferences!.setString(_email, value);
  }

  static getEmail() => _preferences!.getString(_email);

  static getToken() => _preferences!.getString(_token);

  static getFirstname() => _preferences!.getString(_firstname);

  static getLastname() => _preferences!.getString(_lastname);

  static getSignedIn() => _preferences!.getBool(_hasSignedIn);

  static getThemeMode() => _preferences!.getBool(_darkMode);

  static clearPrefs() => _preferences!.clear();
}
